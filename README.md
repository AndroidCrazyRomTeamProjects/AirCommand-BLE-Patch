# AirCommand legacy BLE S Pen patch

This repository contains an experiment for adding support for legacy BLE S Pen
models to Samsung AirCommand `7.6.34.7`. The patch adds the routing changes
for model-specific factories, while the factory implementations are stored
separately in [`legacy_factories/`](./legacy_factories) for clarity. The
payload contains drivers, device features, and charging drivers for:

- `CROWN`
- `DAVINCI`
- `CANVAS`
- `RAINBOW`

There are two implementation paths:

1. A static smali patch, represented by
   [`0001-Air-Command-Added-support-for-legacy-S-Pen-BLE-S-Pen.patch`](./0001-Air-Command-Added-support-for-legacy-S-Pen-BLE-S-Pen.patch).
2. A shell-based decompile, patch, and remapping workflow in
   [`patch.sh`](./patch.sh).

## What the patch is intended to do

AirCommand reads the device configuration property
`BLE_SPEN_SPECS` (for example `crown`) and converts it to an internal
`SpenModelName`. The stock application only knows its original models. The
static patch attempts to:

1. Extend the obfuscated `z1.a` enum with four additional values.
2. Expand the enum `$VALUES` array and the switch-map used by model routing.
3. Route each new enum value to a model-specific factory.
4. Add the corresponding BLE driver and charging implementation.
5. Preserve the original factory behavior for the existing models.

The patch file now contains only the routing/enum changes. The legacy factory
smali files are no longer embedded as thousands of lines in the patch.
The build script ['patch.sh'](./patch.sh) checks that the patch applies, validates that the four factory files
and routing markers exist, and optionally rebuilds an unsigned APK. 

### What `patch.sh` does

[`patch.sh`](./patch.sh) is a separate Linux/WSL-style workflow. It:

1. Decompiles `AirCommand.apk` with apktool into `AirCommand_decompiled`.
2. Applies the patch with `patch -p1 -d AirCommand_decompiled`.
3. Copies the legacy driver/factory smali payload into the decompiled tree.
4. Runs [`rewrite_legacy_factories.sh`](./rewrite_legacy_factories.sh) and
      [`rewrite_legacy_drivers.sh`](./rewrite_legacy_drivers.sh) against that tree
      to repair superclass and `invoke-super` relationships without modifying the
      source payload.
5. Reads [`aircommand_7.6.34.7_mappings.txt`](https://raw.githubusercontent.com/AndroidCrazyRomTeamProjects/one-ui-7-mappings/refs/heads/master/aircommand_7.6.34.7_mappings.txt).
6. Loads the `SpenModelName` enum-field mapping from
   [`emumMap.json`](./emumMap.json).
7. Extracts class, method, and field mappings from the R8 mapping file.
8. Converts the mappings to slash-separated smali names.
9. Rewrites enum constants to their short names, then re-applies the class
   replacements below
   `smali/com/samsung/android/service/aircommand/remotespen/core/device/control/factory`.

This means `patch.sh` is not just an apply step. It decompiles the APK, applies
the smaller routing patch, copies the separately maintained
`legacy_factories/smali` payload into the decompiled tree, and then re-applies
the old obfuscation mapping to the driver/factory sources so they can match the
original APK's naming scheme. Structural modernization happens before mapping,
so readable superclass references are corrected before they are obfuscated.
The final step rebuilds an unsigned `AirCommand_patched.apk`; it does not sign
the APK, verify DEX output, or update method-level signatures.

The script currently assumes the factory package from `7.1.22.1` and mapping from the
`7.6.34.7` build. In newer AirCommand versions, the important factory creator
function and/or its containing class has changed, and the old mapping does not
describe that function. Class-level replacement therefore cannot recover the
new method name, overload, return type, or routing table. It can leave a
factory with a superclass that is still missing, or make the new code compile
against a method signature that no longer exists.

The current `TARGET_DIR` assumption is also important: the decompiled
directory must contain the exact `core/device/control/factory` path before the
mapping loop runs. If the newer APK uses a different package, a different
smali split, or another obfuscation layout, the script stops before remapping
or remaps nothing useful. This should be treated as a version-specific
bootstrap script, not a universal patcher.

The payload is intentionally stored below
`legacy_factories/smali/com/samsung/android/service/aircommand/remotespen/core/device/control/factory`.
That directory mirrors the classes' declared `core.device` package and makes
the source payload independently reviewable. `patch.sh` copies it with
`cp -a` and verifies that `BleSpenDeviceFactory.smali` exists before applying
class-level mappings.

### How the S Pen driver mapping was found, and how the feature mapping follows it

Compare a readable class from `AirCommand_reablable` with the obfuscated
class that occupies the same constructor/field slot in
`AirCommand_new`:

| Readable (`AirCommand_reablable`) | Obfuscated (`AirCommand_decompiled`) | How it was identified |
| --- | --- | --- |
| `shared.BleSpenGenericDriver` | `V2.i` | Crown/Canvas drivers `.super` this type; mapping already had `V2.i -> BleSpenGenericDriver`. Crown `UUID_SPEN_SERVICE` became field `c`. |
| `SpenModelName` | `z1.a` | First constructor argument of `V2.i`. |
| `BleSpenDeviceFeature` | `c3.b` | Second constructor argument of `V2.i` is `Lc3/b;`. `b3.d.d()` (`getDeviceFeature`) returns `Lc3/b;`. Ext1 factory stores `static Lc3/b;`. Ext1 readable feature constants (`0x546`, 30s boot charge, `"ext1"`/`"pro"`) match `c3.b` packed-switch case `1`. Builtin uses subclass `c3.a` and `Lc3/b;-><init>(I)V`. |
| `FmmDriver` / `GenericFmmDriver` | `P6.b` | Third constructor argument of `V2.i`. |
| `FirmwareUpgradeDriver` / `DialogFirmwareUpgradeDriver` | `V2.e` / `W2.a` | Fourth constructor argument of `V2.i` is `LW2/a;`. |
| `BleSpenApplicationFeature` | `c3.c` | `b3.d.b()` returns `Lc3/c;`. Built with no-arg + copy constructors, not the old 12-arg ctor. |
| `BleSpenDeviceFactory` | `b3.d` | Already remapped. Creator methods: `a()` driver, `b()` app feature, `d()` device feature, `e(Context)` wacom. |

The mapping file used by `patch.sh` lived at
[`C:\Users\eri\Desktop\one ui 7 mappings\aircommand_7.6.34.7_mappings.txt`](file:///C:/Users/eri/Desktop/one%20ui%207%20mappings/aircommand_7.6.34.7_mappings.txt)
and previously had `c3.b -> c3.b`, so class replacement never rewrote
`BleSpenDeviceFeature`. It now maps `c3.b` to
`...factory.BleSpenDeviceFeature` plus the method letters `a()`–`r()`.

Legacy `*SpenDeviceFeature` classes now `.super Lc3/b;` and call
`Lc3/b;-><init>(I)V` the same way builtin `c3.a` does, instead of a missing
no-arg `BleSpenDeviceFeature` constructor.

Do not rebuild from `AirCommand_new/smali/.../remotespen/device/...`. Those
files still had the readable `BleSpenDeviceFeature` descriptors. The patched
tree is
`.../remotespen/core/device/control/factory`.

## Current connection failure: timeout while connecting

The latest log shows AirCommand starts a connection attempt for the `CROWN` pen
but does not complete it. The status remains `CONNECTING` while the Wacom driver
cycles through charge commands. The driver eventually times out, closes its BLE
connection, and AirCommand forces a reset after exhausting retries:

```text
[AirCmd]_RemoteSpenMainController: ... CROWN ... CONNECTING ... Starts connect
[AirCmd]_BleDriver: open : Failed to connect - TIMEOUT
[AirCmd]_BleSpenConnector: onFinishDriverOpen : TIMEOUT
[AirCmd]_RemoteSpenMainController: ... CROWN ... DISCONNECTED ... OUT_OF_RETRY_COUNT
```

This is the current user-visible failure to investigate: the pen appears to
hang while connecting, then ends disconnected. The supplied log also reports
`Invalid resource ID 0x00000000` twice while opening the S Pen settings screen.
Track that resource failure separately and identify the missing or zero-valued
resource reference.

The connection timeout should be debugged from the BLE open transaction and
its active charging commands. Capture the first failing operation and timing
before changing retry behavior. Do not treat the earlier charging-driver
verifier crash as the current incident; the observed failure in this log is a
connection timeout after startup.
## Newer AirCommand versions and missing factory mapping

The mapping file is known to be incomplete for the newer AirCommand build.
It contains useful historical names, but it does not prove that the newer
build's factory creator has the same:

- containing class;
- method name;
- parameter type or overload;
- return type;
- switch-map implementation; or
- factory cache path.

The factory creator is the critical boundary because it turns a model value
into a concrete `BleSpenDeviceFactory`. If that function moved or changed,
the old patch can appear to apply while the application still routes through
the newer implementation and crashes during class resolution.

Do not add a guessed mapping to the mapping file. First capture the newer
build's runtime class inventory and the call stack around factory creation.
[`frida_factory_mapper.js`](./frida_factory_mapper.js) is provided for this
analysis. It is deliberately read-only: it enumerates likely factory classes,
prints their declared methods and superclasses, and logs candidate methods
when they are called. Its observational wrappers immediately delegate to the
original overload; it does not instantiate patched factories or change enum
values. Because Frida wrappers can still affect timing, use it for diagnosis,
not as a production patch.

Run it against the newer package in spawn mode:

```powershell
frida -U -f com.samsung.android.service.aircommand `
  -l .\frida_factory_mapper.js --no-pause
```

Use the output to update the version-specific mapping only after confirming
the exact creator signature. Capture at least:

1. the class that owns the creator;
2. the complete parameter list and return type;
3. the factory base class and interfaces;
4. the model enum/string passed to the creator;
5. the first caller in `Application.onCreate`; and
6. whether the factory is cached before or after creation.

Further analysis is still needed before the static patch can support the
newer version. In particular, compare the mapper output with JADX/smali and
verify the final APK's DEX class descriptors.

## What the Frida debugging attempt does

[`frida_spawn.js`](./frida_spawn.js) is a spawn-time diagnostic and workaround
experiment. It must run before application initialization:

```powershell
frida -U -f com.samsung.android.service.aircommand `
  -l .\frida_spawn.js --no-pause
```

The script uses six hooks:

1. **`N1.a` constructor** (`DeviceFeatures`) reads and caches
   `BLE_SPEN_SPECS` as early as possible.
2. **`x1.f.c()`** (`getSpenModelName`) returns an existing safe enum for a
   recognized legacy spec instead of allowing a null/unsupported model to
   continue.
3. **`x1.f.a()`** (`isBundledSpenSupportBle`) forces BLE support on when the
   known legacy model would otherwise be rejected by configuration.
4. **`androidx.core.view.n.n(z1.a)`** (`createSpenFactory`) attempts to
   instantiate the model-specific factory and return it instead of using the
   stock switch.
5. **`b3.d.c(z1.a)`** (`getInstance`) checks the factory cache and attempts to
   create/cache the model-specific factory if it is missing.
6. **`C1.b.c(Object)`** (`Assert.notNull`) logs a Java stack trace when a null
   value still reaches the application assertion.

The script has a deliberate spawn-only design because the failure occurs very
early in application startup. An attach workflow can miss the constructor and
model lookup, or the process can terminate before Frida finds the application
PID. The script does **not** repair a missing class hierarchy: `Java.use()` or
`$new()` will still fail if the factory’s declared superclass is absent.

## Frida limitations and optimization needs

The runtime experiment is useful for locating the failing path, but it is not
yet a production-quality patch:

- **Fix class identity first.** Update `SPEC_MAP.factoryFqcn` only after the
  APK contains classes with those exact names. A Frida string change cannot
  create a missing superclass.
- **Use exact overloads.** Resolve and hook the precise overload for every
  method. The current fallback between typed and untyped methods can hide a
  wrong mapping in an obfuscated build.
- **Preserve original calls explicitly.** Use saved overload objects and
  `.call()`/`.apply()` consistently. This makes recursion behavior clear and
  avoids accidentally dispatching the replacement implementation again.
- **Do not call the factory constructor repeatedly.** Cache one factory per
  model and verify that the cache key is the enum object expected by `b3.d`.
- **Avoid broad global state.** `detectedSpec` is process-global. Read the
  configuration from the same `Context`/feature object used by the target
  invocation and validate the value against `SPEC_MAP`.
- **Reduce startup logging.** Set `VERBOSE = false` after the routing path is
  understood. Keep a compact error log containing the spec, selected factory,
  and class-loading exception.
- **Validate class availability before routing.** Call `Java.use()` for the
  factory, superclass, and required interfaces before changing
  `getSpenModelName`; otherwise the script may replace one crash with a later
  null or cast failure.
- **Separate diagnosis from behavior changes.** The `Assert.notNull` hook
  should be diagnostic only and should not mask a failed initialization.
- **Test more than startup.** A process that reaches `onCreate` may still fail
  during BLE discovery, service binding, firmware handling, charging, or
  switch-table dispatch.

## Recommended TODO list

### P0: make the APK loadable

- [x] Pick obfuscated integration (`b3.d`, `c3.b`, `V2.i`, …), not a second
  de-obfuscated hierarchy.
- [x] Make every new factory extend `b3.d` and every new feature extend `c3.b`.
- [x] Map `BleSpenDeviceFeature` → `c3.b` using the same readable-vs-decompiled
  comparison used for the S Pen driver (`V2.i`).
- [ ] Rebuild and inspect the output DEX/APK to confirm there is a `Lc3/b;`
  class and **no** leftover `L.../BleSpenDeviceFeature;` descriptor.
- [ ] Trace and fix the `Invalid resource ID 0x7f110191` errors seen when
  opening the S Pen settings screen.
- [ ] Install a signed test APK and capture the **next** class-loading error
  from logcat (likely another unmapped readable type, not this one).
- [ ] Reconcile remaining constructor mismatches: `V2.i` wants
  `(Lz1/a;Lc3/b;LP6/b;LW2/a;)`, `c3.c` only has `()` and `(Lc3/c;)`, and
  several `c3.b` methods are `final` so Crown/Canvas overrides of `a()`/`g()`
  cannot replace packed-switch behavior.

### P1: make routing correct

- [ ] Verify the exact `BLE_SPEN_SPECS` values on each target device.
- [X] Choose one model-to-ordinal mapping and update the enum, `$VALUES` array,
  switch tables, factory creator, and Frida `SPEC_MAP` together.
- [ ] Test `crown`, `canvas`, `rainbow`, `davinci`, an original model, an empty
  spec, and an unknown spec.
- [ ] Confirm that the factory cache uses the correct key and does not return a
  factory for the wrong model.
- [ ] Verify `createBleSpenDriver()` return types and all driver dependencies.

### P2: validate BLE behavior

- [ ] Reach AirCommand startup without Frida and with Frida, comparing logs.
- [ ] Test BLE scan/discovery and connection.
- [ ] Test pen button events, battery reporting, reconnect, and disconnect.
- [ ] Test firmware/version queries if supported by the pen.
- [ ] Port the charging drivers for every remaining legacy model, then test
  insertion/removal and each supported charging operation.
- [ ] Capture a minimal reproducible log for each failure and retain the first
  cause rather than only the final exception.

### P3: improve the tooling

- [ ] Add a static descriptor consistency check that compares each `.class`,
  `.super`, and reference descriptor with its file path and known target
  classes.
- [ ] Add an APK/Dex verification step to
  [`patch-aircommand.ps1`](./patch-aircommand.ps1) before installation.
- [ ] Run [`frida_factory_mapper.js`](./frida_factory_mapper.js) on the newer
  AirCommand build and record the actual factory creator mapping.
- [x] Point `patch.sh` at the One UI 7 mapping file
  (`C:\Users\eri\Desktop\one ui 7 mappings\aircommand_7.6.34.7_mappings.txt`)
  and record `c3.b`, `c3.c`, `P6.b`, and `A2.t`.
- [ ] Keep method remaps class-scoped. Global `createBleSpenDriver` → `a`
  replacements currently corrupt unrelated invoke lines.
- [ ] Replace the heuristic generator
  [`patch_to_frida.py`](./patch_to_frida.py) with signature-aware generation;
  its current `UNKNOWN_CLASS` output is only a scaffold and is not safe to run.
- [ ] Keep one authoritative Frida script and remove or label stale variants
  such as [`frida_script.js`](./frida_script.js).
- [ ] Record the exact AirCommand build, Android version, device model,
  `BLE_SPEN_SPECS`, APK hash, signing method, and Frida version for each test.

## Current status

Factory routing now uses obfuscated names for the factory base (`b3.d`) and
the device feature (`c3.b`). The latest supplied log reaches the connection
flow but remains in `CONNECTING` until BLE open times out and retry handling
forces a reset. The settings screen also logs an invalid resource ID. The
remaining charging-driver work includes porting the drivers for every legacy
model and confirming their behavior after the connection path is fixed.

