#!/usr/bin/env python3
"""
merge_charging_drivers.py

Merges the legacy BLE S Pen charging drivers (Crown, Davinci, Canvas, Rainbow)
into the unified and final WacomChargingDriver class `k3.a` (descriptor `Lk3/a;`).

In AirCommand 7.6.34.7 (One UI 7), R8 consolidated all Wacom charging drivers into
`Lk3/a;` and declared it `public final`. Subclassing `k3.a` causes ART to throw:
    java.lang.VerifyError: Superclass k3.a of ...CrownWacomChargingDriver is declared final

This script:
1. Correctly resolves `.1` package directories created by apktool on case-insensitive filesystems
   (e.g., `smali/k3.1/a.smali` for `Lk3/a;` and `smali/k3.1/b.smali` for `Lk3/b;`).
2. Patches `Lk3/b;` (the charging executor Runnable) with actions for Crown (turnOff, turnOn, reset).
3. Patches `Lk3/a;` to support Crown discriminator (case 2), delegating Davinci/Canvas to case 1 (Sticky),
   and Rainbow to case 0 (BuiltIn), along with bridge methods (`turnOnWacomChargingModule`, `turnOffWacomChargingModule`, etc.).
4. Updates legacy factory classes (Crown, Davinci, Canvas, Rainbow) and their advertisement listener
   inner classes to instantiate and call `Lk3/a;` directly via `.method public final e(Landroid/content/Context;)Lk3/a;`.
5. Removes obsolete standalone legacy `*WacomChargingDriver*.smali` files so they cannot trigger VerifyError.
"""

import argparse
import os
import re
import shutil
import sys
from pathlib import Path


def find_smali_file_by_descriptor(smali_root: Path, descriptor: str) -> Path | None:
    """
    Finds a smali file on disk matching a given class descriptor (e.g. 'Lk3/a;'),
    taking into account case-insensitive filesystem directory collisions (.1 suffix).
    """
    clean_desc = descriptor.strip()
    if clean_desc.startswith("L") and clean_desc.endswith(";"):
        rel_path = clean_desc[1:-1] + ".smali"
    else:
        rel_path = clean_desc.replace(".", "/") + ".smali"

    # 1. Try exact relative path
    direct_path = smali_root / rel_path
    if direct_path.is_file():
        try:
            first_line = direct_path.read_text(encoding="utf-8", errors="ignore").splitlines()[0]
            if f" {clean_desc}" in first_line:
                return direct_path
        except Exception:
            pass

    # 2. Check path with .1 directory suffixes
    parts = list(Path(rel_path).parts)
    if parts:
        pkg_part = parts[0]
        rest = Path(*parts[1:]) if len(parts) > 1 else Path()

        # Check <pkg>.1
        dot1_path = smali_root / f"{pkg_part}.1" / rest
        if dot1_path.is_file():
            try:
                first_line = dot1_path.read_text(encoding="utf-8", errors="ignore").splitlines()[0]
                if f" {clean_desc}" in first_line:
                    return dot1_path
            except Exception:
                pass

    # 3. Fallback scan matching .class line
    class_target = f" {clean_desc}"
    for smali_file in smali_root.rglob("*.smali"):
        try:
            with open(smali_file, "r", encoding="utf-8", errors="ignore") as f:
                header = f.readline()
                if header.startswith(".class ") and class_target in header:
                    return smali_file
        except Exception:
            continue

    return None


def patch_k3_b(k3_b_file: Path) -> bool:
    """
    Expands Lk3/b; (Runnable) packed-switch to support Crown operations:
      case 0: startCharge (sends "3")
      case 1: stopCharge (sends "5")
      case 2: default resetSpen (sends "3", sleeps 700ms, sends "2")
      case 3: Crown resetSpen (turnOff '0' -> turnOn '1' -> reset '2')
      case 4: Crown startCharge (turnOff '0' -> turnOn '1' -> start '3')
      case 5: Crown stopCharge (turnOff '0')
    """
    content = k3_b_file.read_text(encoding="utf-8-sig")
    if ":pswitch_crown_reset" in content:
        print(f"[*] {k3_b_file} already patched.")
        return False

    print(f"[*] Patching {k3_b_file} (Lk3/b;)...")

    new_run_method = """.method public final run()V
    .locals 2

    iget v0, p0, Lk3/b;->b:I

    packed-switch v0, :pswitch_data_0

    :pswitch_default
    iget-object p0, p0, Lk3/b;->c:Lk3/a;

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "3"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    const-wide/16 v0, 0x2bc

    invoke-static {v0, v1}, Ln5/a;->g1(J)V

    const-string v0, "2"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void

    :pswitch_0
    iget-object p0, p0, Lk3/b;->c:Lk3/a;

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "5"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void

    :pswitch_1
    iget-object p0, p0, Lk3/b;->c:Lk3/a;

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "3"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void

    :pswitch_crown_reset
    iget-object p0, p0, Lk3/b;->c:Lk3/a;

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "0"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "1"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "2"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void

    :pswitch_crown_start_charge
    iget-object p0, p0, Lk3/b;->c:Lk3/a;

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "0"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "1"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "3"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void

    :pswitch_crown_stop_charge
    iget-object p0, p0, Lk3/b;->c:Lk3/a;

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "0"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_default
        :pswitch_crown_reset
        :pswitch_crown_start_charge
        :pswitch_crown_stop_charge
    .end packed-switch
.end method"""

    run_method_regex = r"\.method public (final )?run\(\)V.*?\.end method"
    content = re.sub(run_method_regex, new_run_method, content, count=1, flags=re.DOTALL)
    k3_b_file.write_text(content, encoding="utf-8")
    print(f"  [+] Patched {k3_b_file}")
    return True


def patch_k3_a(k3_a_file: Path) -> bool:
    """
    Patches Lk3/a; to:
      1. Branch on f == 2 (Crown) for c() [resetSpen], e() [startCharge], g() [stopCharge].
      2. Handle f == 2 in f() [startContinuousCharge], d(), h().
      3. Add public bridge methods (turnOnWacomChargingModule, turnOffWacomChargingModule, startCharge()I, etc.).
    """
    content = k3_a_file.read_text(encoding="utf-8-sig")
    if "turnOnWacomChargingModule" in content:
        print(f"[*] {k3_a_file} already patched.")
        return False

    print(f"[*] Patching {k3_a_file} (Lk3/a;)...")

    # 1. Update c() [resetSpen]
    old_c_pattern = r"\.method public final c\(\)V.*?\.end method"
    new_c = """.method public final c()V
    .locals 2

    const-string v0, "WacomDriver"

    const-string v1, "resetSpen"

    invoke-static {v0, v1}, Ln5/a;->F(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lk3/a;->f:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_std_reset

    new-instance v0, Lk3/b;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lk3/b;-><init>(Lk3/a;I)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void

    :cond_std_reset
    new-instance v0, Lk3/b;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lk3/b;-><init>(Lk3/a;I)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void
.end method"""
    content = re.sub(old_c_pattern, new_c, content, count=1, flags=re.DOTALL)

    # 2. Update e() [startCharge]
    old_e_pattern = r"\.method public final e\(\)V.*?\.end method"
    new_e = """.method public final e()V
    .locals 2

    const-string v0, "WacomDriver"

    const-string v1, "startCharge"

    invoke-static {v0, v1}, Ln5/a;->F(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lk3/a;->f:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_std_charge

    new-instance v0, Lk3/b;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lk3/b;-><init>(Lk3/a;I)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void

    :cond_std_charge
    new-instance v0, Lk3/b;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lk3/b;-><init>(Lk3/a;I)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void
.end method"""
    content = re.sub(old_e_pattern, new_e, content, count=1, flags=re.DOTALL)

    # 3. Update g() [stopCharge]
    old_g_pattern = r"\.method public final g\(\)V.*?\.end method"
    new_g = """.method public final g()V
    .locals 2

    const-string v0, "WacomDriver"

    const-string v1, "stopCharge"

    invoke-static {v0, v1}, Ln5/a;->F(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lk3/a;->f:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_std_stop

    new-instance v0, Lk3/b;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lk3/b;-><init>(Lk3/a;I)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void

    :cond_std_stop
    new-instance v0, Lk3/b;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lk3/b;-><init>(Lk3/a;I)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void
.end method"""
    content = re.sub(old_g_pattern, new_g, content, count=1, flags=re.DOTALL)

    # 4. Update f() [startContinuousCharge]
    old_f_pattern = r"\.method public final f\(\)V.*?\.end method"
    new_f = """.method public final f()V
    .locals 2

    iget v0, p0, Lk3/a;->f:I

    packed-switch v0, :pswitch_data_0

    :pswitch_sticky
    const-string v0, "StickySpenWacomDriver"

    const-string v1, "startContinuousCharge"

    invoke-static {v0, v1}, Ln5/a;->F(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lb4/f;

    const/16 v1, 0x15

    invoke-direct {v0, v1, p0}, Lb4/f;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void

    :pswitch_0
    const-string v0, "BuiltInSpenWacomDriver"

    const-string v1, "startContinuousCharge"

    invoke-static {v0, v1}, Ln5/a;->F(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lb4/f;

    const/16 v1, 0x14

    invoke-direct {v0, v1, p0}, Lb4/f;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lk3/a;->b(Ljava/lang/Runnable;)V

    return-void

    :pswitch_crown
    const-string v0, "CrownWacomChargingDriver"

    const-string v1, "startContinuousCharge : Not supported operation"

    invoke-static {v0, v1}, Ln5/a;->F(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lk3/a;->e()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_sticky
        :pswitch_crown
    .end packed-switch
.end method"""
    content = re.sub(old_f_pattern, new_f, content, count=1, flags=re.DOTALL)

    # 5. Append bridge methods
    bridge_methods = """
# Bridge methods for legacy callers
.method public final turnOnWacomChargingModule()V
    .locals 2

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "1"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void
.end method

.method public final turnOffWacomChargingModule()V
    .locals 2

    invoke-virtual {p0}, Lk3/a;->a()V

    const-string v0, "0"

    invoke-virtual {p0, v0}, Lk3/a;->i(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lk3/a;->c:J

    return-void
.end method

.method public final startCharge()I
    .locals 1

    invoke-virtual {p0}, Lk3/a;->e()V

    const p0, 0xea60

    return p0
.end method

.method public final stopCharge()V
    .locals 0

    invoke-virtual {p0}, Lk3/a;->g()V

    return-void
.end method

.method public final resetSpen()V
    .locals 0

    invoke-virtual {p0}, Lk3/a;->c()V

    return-void
.end method
"""
    content += bridge_methods

    k3_a_file.write_text(content, encoding="utf-8")
    print(f"  [+] Patched {k3_a_file}")
    return True


def ensure_crown_open_handshake(crown_driver_file: Path) -> bool:
    """Ensure Crown starts Wacom charging and writes its BLE address before open()."""
    content = crown_driver_file.read_text(encoding="utf-8-sig")
    if "writeBundledBleSpenAddressToEfs" in content:
        return False

    match = re.search(
        r"(?P<method>\.method public declared-synchronized open\(.*?\.end method)",
        content,
        flags=re.DOTALL,
    )
    if not match:
        raise RuntimeError(f"Unable to locate Crown open() in {crown_driver_file}")

    method = match.group("method")
    super_call = re.search(
        r"(?P<indent>\s*)invoke-super(?:/range)? \{[^}]+\}, "
        r"Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->open\(",
        method,
    )
    if not super_call:
        raise RuntimeError(f"Unable to locate Crown super.open() in {crown_driver_file}")

    handshake = """    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->getInstance(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->startCharge()I

    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/BleUtils;->writeBundledBleSpenAddressToEfs(Landroid/content/Context;Ljava/lang/String;)V

"""
    method = method[:super_call.start()] + "\n" + handshake + method[super_call.start():]
    content = content[:match.start("method")] + method + content[match.end("method"):]
    crown_driver_file.write_text(content, encoding="utf-8")
    print(f"  [+] Added Crown charging/EFS handshake to {crown_driver_file}")
    return True


def patch_legacy_factory(factory_file: Path, discriminator: int) -> bool:
    """
    Rewrites a BleSpen*Factory.smali file so that:
      - Field `mWacomChargingDriver` (or `b`) has type `Lk3/a;`
      - Implements `.method public final e(Landroid/content/Context;)Lk3/a;`
      - Implements bridge `.method public getWacomChargingDriver(Landroid/content/Context;)Lk3/a;`
      - Instantiates `new Lk3/a;(Context, discriminator)`
    """
    content = factory_file.read_text(encoding="utf-8-sig")
    class_match = re.search(r"^\ufeff?\.class\s+[^\n]*?\s+(L[^\s;]+;)", content, re.MULTILINE)
    if not class_match:
        return False
    class_name = class_match.group(1)

    print(f"[*] Patching factory {factory_file.name} (discriminator {discriminator})...")

    # Ensure field .field public b:Lk3/a;
    if ".field public b:Lk3/a;" not in content:
        if re.search(r"\.field[^\n]+mWacomChargingDriver:[^\n]+", content):
            content = re.sub(
                r"\.field[^\n]+mWacomChargingDriver:[^\n]+",
                ".field public b:Lk3/a;",
                content,
            )
        elif "# instance fields" in content:
            content = re.sub(
                r"(# instance fields\n)",
                r"\1.field public b:Lk3/a;\n\n",
                content,
            )
        elif "# static fields" in content:
            content = re.sub(
                r"(# static fields\n)",
                r"# instance fields\n.field public b:Lk3/a;\n\n\n\1",
                content,
            )
        elif "# direct methods" in content:
            content = re.sub(
                r"(# direct methods\n)",
                r"# instance fields\n.field public b:Lk3/a;\n\n\n\1",
                content,
            )
        else:
            content = re.sub(
                r"(\.super[^\n]+\n)",
                r"\1\n# instance fields\n.field public b:Lk3/a;\n\n",
                content,
            )

    factory_methods = f"""
.method public final e(Landroid/content/Context;)Lk3/a;
    .locals 2

    iget-object v0, p0, {class_name}->b:Lk3/a;

    if-nez v0, :cond_0

    new-instance v0, Lk3/a;

    const/4 v1, 0x{discriminator:x}

    invoke-direct {{v0, p1, v1}}, Lk3/a;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, {class_name}->b:Lk3/a;

    :cond_0
    iget-object p0, p0, {class_name}->b:Lk3/a;

    return-object p0
.end method

.method public final getWacomChargingDriver(Landroid/content/Context;)Lk3/a;
    .locals 0

    invoke-virtual {{p0, p1}}, {class_name}->e(Landroid/content/Context;)Lk3/a;

    move-result-object p0

    return-object p0
.end method
"""

    content = re.sub(
        r"\.method public (final )?(getWacomChargingDriver|e)\(Landroid/content/Context;\)[^\n]+\n.*?\.end method\n?",
        "",
        content,
        flags=re.DOTALL,
    )

    content += factory_methods
    content = re.sub(r"->mWacomChargingDriver:L[^;]+;", "->b:Lk3/a;", content)
    content = re.sub(r"L[^;\n]+/[A-Za-z]+WacomChargingDriver;", "Lk3/a;", content)

    factory_file.write_text(content, encoding="utf-8")
    print(f"  [+] Patched {factory_file.name}")
    return True


def patch_factory_inner_classes(directory: Path) -> None:
    """
    Patches inner classes (e.g. BleSpenCrownFactory$1) that used to reference
    specific *WacomChargingDriver classes to use Lk3/a;.
    """
    for smali_file in directory.rglob("*Factory$*.smali"):
        content = smali_file.read_text(encoding="utf-8-sig")
        orig = content

        content = re.sub(
            r"(\.field[^\n]+mWacomChargingDriver:)L[^;]+;",
            r"\1Lk3/a;",
            content,
        )
        content = re.sub(
            r"check-cast p1, L[^;]+/[A-Za-z]+WacomChargingDriver;",
            "check-cast p1, Lk3/a;",
            content,
        )
        content = re.sub(
            r"iget-object ([a-z0-9]+), ([a-z0-9]+), (L[^;]+;->mWacomChargingDriver:)L[^;]+;",
            r"iget-object \1, \2, \3Lk3/a;",
            content,
        )
        content = re.sub(
            r"iput-object ([a-z0-9]+), ([a-z0-9]+), (L[^;]+;->mWacomChargingDriver:)L[^;]+;",
            r"iput-object \1, \2, \3Lk3/a;",
            content,
        )
        content = re.sub(
            r"->getWacomChargingDriver\(Landroid/content/Context;\)L[^;]+;",
            "->getWacomChargingDriver(Landroid/content/Context;)Lk3/a;",
            content,
        )
        content = re.sub(
            r"L[^;\n]+/[A-Za-z]+WacomChargingDriver;->",
            "Lk3/a;->",
            content,
        )

        if content != orig:
            smali_file.write_text(content, encoding="utf-8")
            print(f"  [+] Patched inner class {smali_file.name}")


def clean_obsolete_charging_drivers(directory: Path) -> int:
    """
    Removes standalone legacy *WacomChargingDriver*.smali files that cause VerifyError.
    """
    removed = 0
    patterns = [
        "*CrownWacomChargingDriver*.smali",
        "*DavinciWacomChargingDriver*.smali",
        "*CanvasWacomChargingDriver*.smali",
        "*RainbowWacomChargingDriver*.smali",
    ]
    for pattern in patterns:
        for f in directory.rglob(pattern):
            f.unlink()
            removed += 1
            print(f"  [-] Removed obsolete driver file: {f.name}")
    return removed


def main():
    parser = argparse.ArgumentParser(
        description="Merge legacy BLE S Pen charging drivers into k3.a (WacomChargingDriver)."
    )
    parser.add_argument(
        "--apk-dir",
        type=Path,
        default=Path("AirCommand_7.6.34.7"),
        help="Path to decompiled APK directory (default: AirCommand_7.6.34.7)",
    )
    parser.add_argument(
        "--legacy-dir",
        type=Path,
        default=Path("legacy_factories"),
        help="Path to legacy factories directory (default: legacy_factories)",
    )
    args = parser.parse_args()

    apk_smali_root = args.apk_dir / "smali"
    if not apk_smali_root.is_dir():
        print(f"[!] Smali root not found at {apk_smali_root}")
        sys.exit(1)

    print(f"=== Merging Charging Drivers into k3.a ===")
    print(f"Target APK smali root: {apk_smali_root}")
    print(f"Legacy factories dir:  {args.legacy_dir}")

    # 1. Locate k3.a and k3.b
    k3_a = find_smali_file_by_descriptor(apk_smali_root, "Lk3/a;")
    k3_b = find_smali_file_by_descriptor(apk_smali_root, "Lk3/b;")

    if not k3_a:
        print("[!] ERROR: Could not locate smali file for Lk3/a; in target APK.")
        sys.exit(1)
    if not k3_b:
        print("[!] ERROR: Could not locate smali file for Lk3/b; in target APK.")
        sys.exit(1)

    print(f"[+] Found Lk3/a; at: {k3_a}")
    print(f"[+] Found Lk3/b; at: {k3_b}")

    # 2. Patch k3.b and k3.a
    patch_k3_b(k3_b)
    patch_k3_a(k3_a)

    # 3. Patch legacy factories:
    # Model -> Discriminator mapping:
    #   0: Rainbow / BuiltIn (uses commands 3->8 for continuous charge, 700ms reset, 5 stop)
    #   1: Davinci / Canvas / Sticky (uses commands 3->4 for continuous charge, 5 stop)
    #   2: Crown (uses turnOff '0', turnOn '1', reset '2', charge '3')
    factory_configs = [
        ("BleSpenCrownFactory.smali", 2),
        ("BleSpenDavinciFactory.smali", 1),
        ("BleSpenCanvasFactory.smali", 1),
        ("BleSpenRainbowFactory.smali", 0),
    ]

    target_dirs = [args.legacy_dir]
    if args.apk_dir.is_dir() and args.apk_dir != args.legacy_dir:
        target_dirs.append(args.apk_dir)

    for base_dir in target_dirs:
        for crown_driver_file in base_dir.rglob("BleSpenCrownDriver.smali"):
            ensure_crown_open_handshake(crown_driver_file)
        for factory_name, disc_id in factory_configs:
            for factory_file in base_dir.rglob(factory_name):
                patch_legacy_factory(factory_file, disc_id)

        patch_factory_inner_classes(base_dir)

    # 4. Clean obsolete driver classes in legacy_dir and target apk
    print("[*] Cleaning up obsolete standalone driver classes...")
    removed_count = 0
    if args.legacy_dir.is_dir():
        removed_count += clean_obsolete_charging_drivers(args.legacy_dir)
    if args.apk_dir.is_dir():
        removed_count += clean_obsolete_charging_drivers(args.apk_dir)

    print(f"[*] Done. Removed {removed_count} obsolete driver files.")
    print("[*] Charging drivers successfully merged into Lk3/a;!")


if __name__ == "__main__":
    main()
