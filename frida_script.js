/**
 * AirCommand BLE S-Pen Legacy Support — Frida Runtime Patch
 *
 * Implements the logic from:
 *   0001-Air-Command-Added-support-for-legacy-S-Pen-BLE-S-Pen.patch
 *
 * Targets: Air Command 7.6.34.7  (aircommand_7_6_34_7_mappings.txt)
 *
 * What this does (mirrors the smali patch exactly):
 *   1. Extends SpenModelName enum (z1.a) with CROWN/CANVAS/RAINBOW/DAVINCI
 *   2. Hooks BleSpenDeviceFactory creator (n.1 → createSpenFactory) to route
 *      the four new ordinals to their factory classes
 *   3. Hooks ModelFeatures.getSpenModelName (x1.f.c) to recognise the new
 *      spec strings ("crown", "canvas", "rainbow", "davinci")
 *   4. Hooks the synthetic switch-table initialiser (I2.c) so ordinals 4-7
 *      map cleanly in any switch() that uses the $VALUES array
 *
 * Usage:
 *   frida -U -f com.samsung.android.aircommand -l aircommand_ble_patch.js --no-pause
 *   frida -U --attach-name com.samsung.android.aircommand -l aircommand_ble_patch.js
 */

"use strict";

/* ─────────────────────────────────────────────────────────────────────────────
 * Name conversion map
 * Obfuscated class/method  →  human-readable equivalent
 * Derived from aircommand_7_6_34_7_mappings.txt + patch file class names
 * ───────────────────────────────────────────────────────────────────────────*/
const NAME_MAP = {
    /* ── Obfuscated → deobfuscated (from mappings.txt) ── */
    classes: {
        "androidx.core.view.n":  "SeslBaseReflector",
        "androidx.core.view.y0": "androidx.core.view.y0",
        "b2.h":                  "b2.h",
        "b3.a":                  "BleSpenBuiltinFactory",
        "b3.c":                  "BleSpenExt1Factory",
        "b3.d":                  "BleSpenDeviceFactory",
        "b3.e":                  "BleSpenStickyFactory",
        "c3.b":                  "c3.b  [holds UUID_LEGACY_SPEN_SERVICE / UUID_SPEN_SERVICE]",
        "C1.b":                  "Assert",
        "d3.a":                  "RemoteFeedbackListener",
        "D2.a":                  "BleSpenUuid",
        "f3.a":                  "f3.a  [log composer]",
        "F2.a":                  "BleSpenBlindChargeController",
        "F2.d":                  "BleSpenChargeController",
        "h2.e":                  "SpenInstanceIdHelper",
        "k3.a":                  "WacomChargingDriver",
        "n5.a":                  "Log",
        "N1.a":                  "DeviceFeatures",
        "o5.b":                  "DLS  [samsung analytics sender]",
        "O1.b":                  "SemFloatingFeatureWrapper",
        "p3.c":                  "p3.c  [transaction log view controller]",
        "T2.d":                  "BleConnReqData",
        "T2.h":                  "BleSpenInstanceId",
        "U2.b":                  "FirmwareFile",
        "V2.b":                  "BleSpenBleDriver",
        "V2.d":                  "BleSpenBuiltinDriver",
        "V2.e":                  "FirmwareUpgradeDriver",
        "V2.g":                  "BleSpenExt1Driver",
        "V2.i":                  "BleSpenGenericDriver",
        "V2.j":                  "BleSpenStickyDriver",
        "W2.a":                  "DialogFirmwareUpgradeDriver",
        "x1.f":                  "ModelFeatures",
        "z1.a":                  "SpenModelName  [enum]",
        "I2.c":                  "I2.c  [SpenModelName switch-map table]",

        /* ── New classes added by the patch ── */
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.crown.BleSpenCrownDriver":    "BleSpenCrownDriver",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.crown.BleSpenCrownFactory":   "BleSpenCrownFactory",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.crown.CrownSpenDeviceFeature":"CrownSpenDeviceFeature",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.crown.CrownWacomChargingDriver":"CrownWacomChargingDriver",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.canvas.BleSpenCanvasDriver":  "BleSpenCanvasDriver",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.canvas.BleSpenCanvasFactory": "BleSpenCanvasFactory",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.canvas.CanvasSpenDeviceFeature":"CanvasSpenDeviceFeature",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.canvas.CanvasWacomChargingDriver":"CanvasWacomChargingDriver",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.rainbow.BleSpenRainbowDriver": "BleSpenRainbowDriver",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.rainbow.BleSpenRainbowFactory":"BleSpenRainbowFactory",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.rainbow.RainbowSpenDeviceFeature":"RainbowSpenDeviceFeature",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.rainbow.RainbowWacomChargingDriver":"RainbowWacomChargingDriver",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.davinci.BleSpenDavinciDriver": "BleSpenDavinciDriver",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.davinci.BleSpenDavinciFactory":"BleSpenDavinciFactory",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.davinci.DavinciSpenDeviceFeature":"DavinciSpenDeviceFeature",
        "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.davinci.DavinciWacomChargingDriver":"DavinciWacomChargingDriver",
    },

    methods: {
        /* b3.d (BleSpenDeviceFactory) */
        "b3.d.a()":        "BleSpenDeviceFactory.createBleSpenDriver()",
        "b3.d.c(z1.a)":    "BleSpenDeviceFactory.getInstance(SpenModelName)",
        /* x1.f (ModelFeatures) */
        "x1.f.a()":        "ModelFeatures.isBundledSpenSupportBle()",
        "x1.f.c()":        "ModelFeatures.getSpenModelName()",
        /* z1.a enum values */
        "z1.a.c":          "SpenModelName.NONBLE   (ordinal 0)",
        "z1.a.d":          "SpenModelName.STICKY   (ordinal 1)",
        "z1.a.e":          "SpenModelName.BUILTIN  (ordinal 2)",
        "z1.a.f":          "SpenModelName.PRO      (ordinal 3) – EJ-P5450",
        /* new enum values added by patch */
        "z1.a.CROWN":      "SpenModelName.CROWN    (ordinal 4)",
        "z1.a.CANVAS":     "SpenModelName.CANVAS   (ordinal 5)",
        "z1.a.RAINBOW":    "SpenModelName.RAINBOW  (ordinal 6)",
        "z1.a.DAVINCI":    "SpenModelName.DAVINCI  (ordinal 7)",
        /* D2.a (BleSpenUuid) */
        "D2.a.a":          "BleSpenUuid.BUTTON_EVENT",
        "D2.a.b":          "BleSpenUuid.BATTERY_LEVEL",
        "D2.a.c":          "BleSpenUuid.BATTERY_LEVEL_RAW",
        "D2.a.d":          "BleSpenUuid.FW_VER",
        "D2.a.e":          "BleSpenUuid.MODE",
        "D2.a.f":          "BleSpenUuid.CHARGE_STATUS",
        "D2.a.g":          "BleSpenUuid.SELF_TEST",
        "D2.a.h":          "BleSpenUuid.RAW_SENSOR_DATA",
        "D2.a.i":          "BleSpenUuid.EASY_CONNECT_ID",
        "D2.a.j":          "BleSpenUuid.FMM_CONFIG",
        "D2.a.k":          "BleSpenUuid.LED_STATE",
        "D2.a.l":          "BleSpenUuid.PEN_LOG",
        "D2.a.m":          "BleSpenUuid.PEN_FREQUENCY",
        "D2.a.n":          "BleSpenUuid.OBFUSCATION_TABLE",
        "D2.a.o":          "BleSpenUuid.PEN_SYNC_CLOCK",
        "D2.a.p":          "BleSpenUuid.CHARACTERISTIC_CONFIG",
        /* V2.i (BleSpenGenericDriver) fields */
        "V2.i.b":          "BleSpenGenericDriver.mContext",
        "V2.i.c":          "BleSpenGenericDriver.spenModelName",
        "V2.i.p":          "BleSpenGenericDriver.mLogComposer",
        "V2.i.r":          "BleSpenGenericDriver.mPerformCalibrationListener",
        /* N1.a (DeviceFeatures) booleans */
        "N1.a.a":          "DeviceFeatures.UNPACK_SUPPORT",
        "N1.a.b":          "DeviceFeatures.BIXBY_SUPPORT",
        "N1.a.c":          "DeviceFeatures.DIRECT_WRITING_SUPPORT",
        "N1.a.d":          "DeviceFeatures.QUICK_CONNECT_SUPPORT",
        "N1.a.e":          "DeviceFeatures.SCREEN_RECORDER_SUPPORT",
        "N1.a.f":          "DeviceFeatures.SURVEY_MODE_ENABLED",
        "N1.a.i":          "DeviceFeatures.FIRST_API_BELLOW_34",
        "N1.a.k":          "DeviceFeatures.BLE_SPEN_SPECS",
        "N1.a.l":          "DeviceFeatures.S_PEN_GARAGE_SPEC",
        "N1.a.m":          "DeviceFeatures.DEVICE_BLUR_SUPPORT",
        "N1.a.n":          "DeviceFeatures.NATIVE_AI_SUPPORT",
        "N1.a.u":          "DeviceFeatures.BleSpenNotSupported",
        /* O1.b (SemFloatingFeatureWrapper) */
        "O1.b.a(String)":  "SemFloatingFeatureWrapper.hasFeature(String)",
        "O1.b.b(String)":  "SemFloatingFeatureWrapper.getFeature(String)",
        "O1.b.c()":        "SemFloatingFeatureWrapper.getSpenVersion()",
        "O1.b.d()":        "SemFloatingFeatureWrapper.getAiVersion()",
        "O1.b.e(String)":  "SemFloatingFeatureWrapper.getString(String)",
        /* WacomChargingDriver (k3.a) */
        "k3.a.a()":        "WacomChargingDriver.ensureMinTransactionInterval()",
        "k3.a.b(Runnable)":"WacomChargingDriver.ensureNotMainThread(Runnable)",
        "k3.a.c()":        "WacomChargingDriver.resetSpen()",
        "k3.a.e()":        "WacomChargingDriver.startCharge()",
        "k3.a.f()":        "WacomChargingDriver.startContinuousCharge()",
        "k3.a.g()":        "WacomChargingDriver.stopCharge()",
        "k3.a.i(String)":  "WacomChargingDriver.ensureCommandWriteInterval(String)",
        /* Log (n5.a) */
        "n5.a.H(String,String,Exception)":   "Log.e(tag, msg, exception)",
        "n5.a.o0(String,String,JSONException)":"Log.i(tag, msg, jsonException)",
    },

    /* BLE spec strings found in NativeAI / SemFloatingFeature config */
    specStrings: {
        "sticky":  "SpenModelName.STICKY   → BleSpenStickyFactory  (ordinal 1)",
        "builtin": "SpenModelName.BUILTIN  → BleSpenBuiltinFactory (ordinal 2)",
        "ext1":    "SpenModelName.PRO/EXT1 → BleSpenExt1Factory    (ordinal 3)",
        "crown":   "SpenModelName.CROWN    → BleSpenCrownFactory   (ordinal 4)  [NEW]",
        "canvas":  "SpenModelName.CANVAS   → BleSpenCanvasFactory  (ordinal 5)  [NEW]",
        "rainbow": "SpenModelName.RAINBOW  → BleSpenRainbowFactory (ordinal 6)  [NEW]",
        "davinci": "SpenModelName.DAVINCI  → BleSpenDavinciFactory (ordinal 7)  [NEW]",
    },
};

/* ─────────────────────────────────────────────────────────────────────────────
 * Helpers
 * ───────────────────────────────────────────────────────────────────────────*/
const TAG = "[BLE-PATCH]";

function log(msg)  { console.log(`${TAG} ${msg}`); }
function warn(msg) { console.warn(`${TAG} ⚠  ${msg}`); }

function resolveClass(name) {
    try { return Java.use(name); }
    catch(e) { warn(`Cannot resolve class: ${name} — ${e.message}`); return null; }
}

/**
 * Instantiate a factory class by its fully-qualified name.
 * Returns the new Java object, or null on failure.
 */
function newFactory(fqcn) {
    const cls = resolveClass(fqcn);
    if (!cls) return null;
    try {
        return cls.$new();
    } catch(e) {
        warn(`Failed to instantiate ${fqcn}: ${e.message}`);
        return null;
    }
}

/* ─────────────────────────────────────────────────────────────────────────────
 * Patch 1 — BleSpenDeviceFactory.getInstance(SpenModelName)
 *
 * Obfuscated:  b3.d  method  c(z1.a) → createSpenFactory
 * The original switch only handles ordinals 0-3 (NONBLE/STICKY/BUILTIN/PRO).
 * We intercept and handle 4-7 before the original code runs.
 * ───────────────────────────────────────────────────────────────────────────*/
function patchFactoryCreator() {
    const FactoryCls = resolveClass("b3.d");
    if (!FactoryCls) return;

    /* The patch targets the static method n() in androidx.core.view.n.1
     * which is the real createSpenFactory implementation.
     * Obfuscated mapping:  androidx.core.view.n → SeslBaseReflector
     *                       method n(z1.a) → createSpenFactory          */
    const ReflectorCls = resolveClass("androidx.core.view.n");
    if (!ReflectorCls) return;

    /*
     * Hook the static method.  In the smali it is declared as:
     *   .method public static n(Lz1/a;)Lb3/d;
     */
    try {
        ReflectorCls.n.implementation = function(spenModelName) {
            const ordinal = spenModelName.ordinal();
            log(`createSpenFactory called — ordinal=${ordinal}  name=${spenModelName.name()}`);

            let factory = null;
            switch (ordinal) {
                case 4: // CROWN
                    log("→ routing to BleSpenCrownFactory");
                    factory = newFactory(
                        "com.samsung.android.service.aircommand.remotespen" +
                        ".core.device.control.factory.crown.BleSpenCrownFactory"
                    );
                    break;
                case 5: // CANVAS
                    log("→ routing to BleSpenCanvasFactory");
                    factory = newFactory(
                        "com.samsung.android.service.aircommand.remotespen" +
                        ".core.device.control.factory.canvas.BleSpenCanvasFactory"
                    );
                    break;
                case 6: // RAINBOW
                    log("→ routing to BleSpenRainbowFactory");
                    factory = newFactory(
                        "com.samsung.android.service.aircommand.remotespen" +
                        ".core.device.control.factory.rainbow.BleSpenRainbowFactory"
                    );
                    break;
                case 7: // DAVINCI
                    log("→ routing to BleSpenDavinciFactory");
                    factory = newFactory(
                        "com.samsung.android.service.aircommand.remotespen" +
                        ".core.device.control.factory.davinci.BleSpenDavinciFactory"
                    );
                    break;
                default:
                    // Ordinals 0-3 — let original code handle them
                    log("→ delegating to original (ordinal ≤ 3)");
                    return this.n(spenModelName);
            }

            if (factory !== null) return factory;

            // Factory class not present on this build — fall back to original
            warn(`Factory class not found for ordinal ${ordinal}, falling back`);
            return this.n(spenModelName);
        };
        log("✓ Hooked createSpenFactory (androidx.core.view.n.n)");
    } catch(e) {
        warn(`createSpenFactory hook failed: ${e.message}`);
    }
}

/* ─────────────────────────────────────────────────────────────────────────────
 * Patch 2 — ModelFeatures.getSpenModelName()
 *
 * Obfuscated:  x1.f  method  c() → getSpenModelName
 * The smali (x1.1/f.smali) is extended to check for "crown", "canvas",
 * "rainbow", "davinci" before the original "sticky" / "builtin" checks.
 *
 * The spec string is read from:
 *   x1.f.b (field of type x4.d) → iget b:Z for BLE support flag
 *   x1.f.a (field of type V0.e) → iget c:Ljava/lang/String (the spec string)
 * ───────────────────────────────────────────────────────────────────────────*/
function patchModelFeatures() {
    const ModelFeaturesCls = resolveClass("x1.f");
    if (!ModelFeaturesCls) return;

    const SpenModelNameCls = resolveClass("z1.a");
    if (!SpenModelNameCls) return;

    /* Helper: resolve a SpenModelName enum constant by its Java field name.
     * Fields c/d/e/f are original; we add CROWN/CANVAS/RAINBOW/DAVINCI
     * as Java enum values injected in Patch 3 below.               */
    function getEnumByFieldName(fieldName) {
        try { return SpenModelNameCls[fieldName].value; }
        catch(e) { return null; }
    }

    try {
        ModelFeaturesCls.c.implementation = function() {
            // Mirror original BLE-support check (field b of inner x4.d object)
            const bleFlags = this.b.value;           // x4.d instance
            if (!bleFlags.b.value) {
                log("getSpenModelName → BLE not supported, returning null/NONBLE");
                return this.c();  // call original — it returns null/NONBLE
            }

            // Read the spec string (field c of V0.e config object)
            const specStr = this.a.value.c.value;
            log(`getSpenModelName — specStr="${specStr}"`);

            const s = (specStr || "").toLowerCase();

            // New models — check first (mirrors smali ordering)
            if (s === "crown") {
                log("→ CROWN");
                return getEnumByFieldName("CROWN") || this.c();
            }
            if (s === "canvas") {
                log("→ CANVAS");
                return getEnumByFieldName("CANVAS") || this.c();
            }
            if (s === "rainbow") {
                log("→ RAINBOW");
                return getEnumByFieldName("RAINBOW") || this.c();
            }
            if (s === "davinci") {
                log("→ DAVINCI");
                return getEnumByFieldName("DAVINCI") || this.c();
            }

            // Original models — fall through to original method
            log("→ delegating to original implementation");
            return this.c();
        };
        log("✓ Hooked ModelFeatures.getSpenModelName (x1.f.c)");
    } catch(e) {
        warn(`getSpenModelName hook failed: ${e.message}`);
    }
}

/* ─────────────────────────────────────────────────────────────────────────────
 * Patch 3 — Inject new SpenModelName enum constants (z1.a)
 *
 * The smali patch adds CROWN (4), CANVAS (5), RAINBOW (6), DAVINCI (7).
 * Java enums are final; we can't add real enum values at runtime.
 * Instead we create synthetic wrapper objects that respond to
 * ordinal() and name() like real enums, and graft them onto the
 * SpenModelName class as static fields that the factory router can read.
 *
 * We also extend $VALUES so that switch-map tables (I2.c) built via
 * values() pick up the new entries.
 * ───────────────────────────────────────────────────────────────────────────*/
function patchSpenModelNameEnum() {
    const SpenModelNameCls = resolveClass("z1.a");
    if (!SpenModelNameCls) return;

    /*
     * Strategy:
     *   • Grab one of the existing enum instances (e.g. NONBLE = field c).
     *   • Use Java reflection to add new static fields to the class.
     *   • Each synthetic constant is a real z1.a instance cloned from
     *     the <init>(String, int, String) constructor used in <clinit>.
     */
    const JavaClass     = Java.use("java.lang.Class");
    const JavaField     = Java.use("java.lang.reflect.Field");
    const ModifierCls   = Java.use("java.lang.reflect.Modifier");
    const ArraysCls     = Java.use("java.util.Arrays");

    // New enum constants: [javaFieldName, ordinal, specString, displayName]
    const NEW_ENUMS = [
        ["CROWN",   4, "crown",   "CROWN"],
        ["CANVAS",  5, "canvas",  "CANVAS"],
        ["RAINBOW", 6, "rainbow", "RAINBOW"],
        ["DAVINCI", 7, "davinci", "DAVINCI"],
    ];

    /*
     * Use the existing $new pathway via <init> if accessible,
     * otherwise use clone + reflection to mutate name/ordinal.
     * z1.a.<init>(String, int, String) is the 3-arg constructor.
     */
    let ctorWorks = false;
    try {
        // Test whether we can call $new directly
        const test = SpenModelNameCls.$new("TEST_PROBE", 99, "test_probe");
        ctorWorks = (test !== null);
    } catch(e) {
        // Expected — enum constructors are normally blocked
    }

    for (const [fieldName, ordinal, specStr, displayName] of NEW_ENUMS) {
        // Skip if already present (re-injection guard)
        try {
            if (SpenModelNameCls[fieldName]) {
                log(`SpenModelName.${fieldName} already exists — skipping`);
                continue;
            }
        } catch(_) { /* not present */ }

        if (ctorWorks) {
            try {
                const instance = SpenModelNameCls.$new(displayName, ordinal, specStr);
                // Graft onto the class as a named static field via reflection
                const jClass     = SpenModelNameCls.class;
                const javaField  = Java.use("sun.misc.Unsafe");   // API < 26 workaround
                // Primary path: use Frida's direct field assignment
                SpenModelNameCls[fieldName] = instance;
                log(`✓ Injected SpenModelName.${fieldName} (ordinal ${ordinal})`);
            } catch(e) {
                warn(`Failed to inject ${fieldName} via $new: ${e.message}`);
            }
        } else {
            /*
             * Fallback: steal an existing instance and swap its private
             * name/ordinal fields via AccessibleObject.setAccessible.
             * We clone from NONBLE (ordinal 0, field c).
             */
            try {
                const existing = SpenModelNameCls.c.value;          // NONBLE
                const clsRef   = existing.getClass();

                // Get superclass (java.lang.Enum) ordinal and name fields
                const enumCls  = Java.use("java.lang.Enum").class;
                const ordField = enumCls.getDeclaredField("ordinal");
                const namField = enumCls.getDeclaredField("name");
                ordField.setAccessible(true);
                namField.setAccessible(true);

                /*
                 * We cannot truly clone a Java object without Cloneable.
                 * Instead, re-use the constructor via reflection.
                 */
                const ctors = clsRef.getDeclaredConstructors();
                let ctor3 = null;
                for (let i = 0; i < ctors.length; i++) {
                    const c = ctors[i];
                    if (c.getParameterTypes().length === 3) { ctor3 = c; break; }
                }
                if (!ctor3) throw new Error("3-arg constructor not found");
                ctor3.setAccessible(true);

                const args = Java.array("java.lang.Object", [
                    Java.use("java.lang.String").$new(displayName),
                    Java.use("java.lang.Integer").$new(ordinal),
                    Java.use("java.lang.String").$new(specStr),
                ]);
                const instance = ctor3.newInstance(args);

                // Expose on the class via a static field inserted by reflection
                const modifiersField = Java.use("java.lang.reflect.Field")
                    .class.getDeclaredField("modifiers");
                modifiersField.setAccessible(true);

                const clsFields = clsRef.getDeclaredField
                    ? null   // getDeclaredField throws for non-existent fields
                    : null;

                // Use Frida's live object assignment as the easiest path
                SpenModelNameCls[fieldName] = instance;
                log(`✓ Injected SpenModelName.${fieldName} via ctor reflection (ordinal ${ordinal})`);
            } catch(e) {
                warn(`Fallback injection failed for ${fieldName}: ${e.message}`);
                /*
                 * Last resort: create a plain JS proxy object that satisfies
                 * ordinal() / name() / b() (the penTypeString getter used in
                 * x1.f.c).  The factory router in patchModelFeatures() handles
                 * the string comparison so the enum object itself is only
                 * needed as a return value.
                 */
                try {
                    const protoInstance = SpenModelNameCls.c.value; // NONBLE
                    const synth = Java.cast(protoInstance, SpenModelNameCls);
                    SpenModelNameCls[fieldName] = synth;
                    warn(`  ↳ Attached NONBLE proxy for ${fieldName} — ordinal() will be wrong!`);
                    warn(`    The factory router uses name strings; enum ordinals in switch-maps will fail.`);
                } catch(e2) {
                    warn(`  ↳ Total failure for ${fieldName}: ${e2.message}`);
                }
            }
        }
    }

    /* Extend $VALUES so values() includes the new constants */
    try {
        const existing = SpenModelNameCls.values();
        const newLen   = Math.max(existing.length, 8);
        const newArr   = Java.array("z1.a", new Array(newLen).fill(null));
        for (let i = 0; i < existing.length; i++) newArr[i] = existing[i];
        for (const [fieldName, ordinal] of NEW_ENUMS) {
            if (SpenModelNameCls[fieldName]) newArr[ordinal] = SpenModelNameCls[fieldName];
        }
        SpenModelNameCls.g.value = newArr;
        log("✓ Extended SpenModelName.$VALUES to length " + newLen);
    } catch(e) {
        warn(`$VALUES extension failed: ${e.message}`);
    }
}

/* ─────────────────────────────────────────────────────────────────────────────
 * Patch 4 — I2.c switch-map table  (<clinit>)
 *
 * The smali (I2/c.smali) builds a lookup array indexed by enum ordinal.
 * Original entries: ordinal 1→1, ordinal 2→2, ordinal 3→3.
 * Patch adds:       ordinal 4→4, ordinal 5→5, ordinal 6→6, ordinal 7→7.
 *
 * We hook the class initialiser by replacing the static field `a` ([I)
 * after the class is first loaded.
 * ───────────────────────────────────────────────────────────────────────────*/
function patchSwitchMap() {
    const SwitchMapCls = resolveClass("I2.c");
    if (!SwitchMapCls) return;

    try {
        Java.scheduleOnMainThread(function() {
            try {
                const arr = SwitchMapCls.a.value;  // int[]
                if (!arr) { warn("I2.c.a is null"); return; }

                /*
                 * The array is sized to values().length.
                 * If our enum injection succeeded, length ≥ 8.
                 * Write the new mappings at indices 4-7.
                 */
                const len = arr.length;
                if (len < 8) {
                    warn(`I2.c.a length=${len} < 8 — new enum ordinals may not be in bounds`);
                    return;
                }
                arr[4] = 4;  // CROWN
                arr[5] = 5;  // CANVAS
                arr[6] = 6;  // RAINBOW
                arr[7] = 7;  // DAVINCI
                SwitchMapCls.a.value = arr;
                log("✓ Extended I2.c switch-map (ordinals 4-7)");
            } catch(e) {
                warn(`I2.c patch (scheduled): ${e.message}`);
            }
        });
    } catch(e) {
        warn(`I2.c patch failed: ${e.message}`);
    }
}

/* ─────────────────────────────────────────────────────────────────────────────
 * Patch 5 — BleSpenDeviceFactory.getInstance (b3.d.c)
 *
 * This is the singleton accessor that looks up the factory by model name.
 * The original HashMap (b3.d.a) is populated lazily; we hook it to ensure
 * our four new factories are present after the first access.
 * ───────────────────────────────────────────────────────────────────────────*/
function patchFactoryMap() {
    const FactoryCls = resolveClass("b3.d");
    if (!FactoryCls) return;

    /*
     * b3.d.c(z1.a) → getInstance(SpenModelName)
     * After it returns, ensure entries for ordinals 4-7 are in the HashMap.
     */
    try {
        FactoryCls.c.implementation = function(spenModelName) {
            const result = this.c(spenModelName);

            // Lazily populate new factory entries
            const map = this.a.value;    // HashMap<z1.a, b3.d>
            if (!map) return result;

            const SpenModelNameCls = resolveClass("z1.a");
            if (!SpenModelNameCls) return result;

            const entries = [
                ["CROWN",   "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.crown.BleSpenCrownFactory"],
                ["CANVAS",  "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.canvas.BleSpenCanvasFactory"],
                ["RAINBOW", "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.rainbow.BleSpenRainbowFactory"],
                ["DAVINCI", "com.samsung.android.service.aircommand.remotespen.core.device.control.factory.davinci.BleSpenDavinciFactory"],
            ];

            for (const [enumField, factoryFqcn] of entries) {
                const enumVal = SpenModelNameCls[enumField];
                if (!enumVal) continue;
                if (!map.containsKey(enumVal)) {
                    const factory = newFactory(factoryFqcn);
                    if (factory) {
                        map.put(enumVal, factory);
                        log(`FactoryMap: added ${enumField} → ${factoryFqcn.split(".").pop()}`);
                    }
                }
            }
            return result;
        };
        log("✓ Hooked BleSpenDeviceFactory.getInstance (b3.d.c)");
    } catch(e) {
        warn(`FactoryMap hook failed: ${e.message}`);
    }
}

/* ─────────────────────────────────────────────────────────────────────────────
 * Diagnostics — log calls to key points for debugging
 * ───────────────────────────────────────────────────────────────────────────*/
function attachDiagnostics() {
    // Log every BLE driver creation
    const GenericDriverCls = resolveClass("V2.i");
    if (GenericDriverCls) {
        try {
            GenericDriverCls.k.implementation = function(ctx) {
                const modelName = this.c.value;
                const friendly = modelName ? NAME_MAP.classes[modelName.toString()] || modelName.toString() : "null";
                log(`BleSpenGenericDriver.initialize — model=${friendly}`);
                return this.k(ctx);
            };
            log("✓ Diagnostics: GenericDriver.initialize hooked");
        } catch(e) { /* method sig may differ */ }
    }

    // Log battery level notifications
    if (GenericDriverCls) {
        try {
            GenericDriverCls.n.implementation = function(level) {
                log(`notifyBatteryLevelChanged — level=${level}`);
                return this.n(level);
            };
        } catch(e) { /* ignore */ }
    }

    // Log gesture type marking (b2.h.L)
    const GestureCls = resolveClass("b2.h");
    if (GestureCls) {
        try {
            GestureCls.L.implementation = function(gesture) {
                log(`markGestureType — type=${gesture}`);
                return this.L(gesture);
            };
        } catch(e) { /* ignore */ }
    }
}

/* ─────────────────────────────────────────────────────────────────────────────
 * Entry point
 * ───────────────────────────────────────────────────────────────────────────*/
Java.perform(function() {
    log("=== AirCommand BLE Legacy S-Pen Patch loading ===");
    log(`Target: com.samsung.android.aircommand  v7.6.34.7`);
    log("");

    patchSpenModelNameEnum();   // Must run first — others depend on the new enums
    patchSwitchMap();
    patchModelFeatures();
    patchFactoryCreator();
    patchFactoryMap();
    attachDiagnostics();

    log("");
    log("=== Patch loaded.  New models: CROWN(4) CANVAS(5) RAINBOW(6) DAVINCI(7) ===");
    log("    Name map available in global: AirCommandNameMap");

    /* Expose name map for REPL use */
    global.AirCommandNameMap = NAME_MAP;
    global.resolveObfName    = (n) => NAME_MAP.classes[n] || NAME_MAP.methods[n] || "unknown";
});