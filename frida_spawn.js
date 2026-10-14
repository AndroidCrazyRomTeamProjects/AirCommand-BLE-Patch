/**
 * AirCommand BLE Legacy S-Pen — Frida Runtime Patch  v2
 *
 * USAGE — MUST use spawn, never attach:
 *   frida -U -f com.samsung.android.service.aircommand \
 *         -l aircommand_ble_patch.js --no-pause
 *
 * WHY ATTACH CRASHES
 * ------------------
 *   The service process starts, reads the spec string "crown" (or canvas /
 *   rainbow / davinci) from SemFloatingFeature, calls getSpenModelName()
 *   which returns null/NONBLE because those strings aren't in the original
 *   enum switch, then passes null into the factory which immediately NPEs.
 *   This all happens in < 200 ms — long before -n attach can find the PID.
 *
 * APPROACH — no enum injection
 * ----------------------------
 *   Injecting new Java enum constants at runtime requires writing to final
 *   fields and bypassing Android hidden-API enforcement (API >= 28).
 *   It is unreliable and itself causes crashes.
 *
 *   Instead we intercept purely at the string level:
 *
 *   Hook 1  DeviceFeatures.<init>   — read BLE_SPEN_SPECS early, cache spec
 *   Hook 2  getSpenModelName        — return a SAFE existing enum (STICKY /
 *                                     BUILTIN) so the app starts cleanly
 *   Hook 3  isBundledSpenSupportBle — force true for new model specs
 *   Hook 4  createSpenFactory       — swap in the real new factory class
 *   Hook 5  getInstance             — cache new factory in the HashMap
 *   Hook 6  Assert.notNull          — log any null slip-through with stack
 *
 *   The safe enum mappings (which existing enum keeps the app alive):
 *     crown   → STICKY  (z1.a.d, ordinal 1)  — has Wacom charging path
 *     canvas  → BUILTIN (z1.a.e, ordinal 2)
 *     rainbow → BUILTIN (z1.a.e, ordinal 2)
 *     davinci → BUILTIN (z1.a.e, ordinal 2)
 */

"use strict";

/* ── tunables ─────────────────────────────────────────────────────────────── */

const VERBOSE     = true;   // set false to reduce logcat noise
const FORCED_SPEC = null;   // override spec detection, e.g. "crown"

/* ── state shared across hooks ────────────────────────────────────────────── */
let detectedSpec = FORCED_SPEC ? FORCED_SPEC.toLowerCase() : null;

/* ── helpers ──────────────────────────────────────────────────────────────── */
const TAG = "[BLE-PATCH]";
const log  = (m) => console.log(`${TAG} ${m}`);
const dbg  = (m) => { if (VERBOSE) console.log(`${TAG}   ${m}`); };
const warn = (m) => console.warn(`${TAG} ⚠  ${m}`);

function tryUse(cls) {
    try   { return Java.use(cls); }
    catch (e) { warn(`Java.use("${cls}") — ${e.message}`); return null; }
}

/* ── spec → routing info ──────────────────────────────────────────────────── */
/*
 * safeEnum : field name on z1.a (SpenModelName) that keeps the app alive
 *            while we arrange the real factory.
 *            "d" = STICKY (ordinal 1),  "e" = BUILTIN (ordinal 2)
 *
 * factoryFqcn : fully-qualified name of the factory class added by the patch.
 *               These classes are already in the APK — we just instantiate them.
 */
const SPEC_MAP = {
    crown: {
        safeEnum:    "d",
        factoryFqcn: "com.samsung.android.service.aircommand.remotespen" +
                     ".core.device.control.factory.crown.BleSpenCrownFactory",
        label: "CROWN",
    },
    canvas: {
        safeEnum:    "e",
        factoryFqcn: "com.samsung.android.service.aircommand.remotespen" +
                     ".core.device.control.factory.canvas.BleSpenCanvasFactory",
        label: "CANVAS",
    },
    rainbow: {
        safeEnum:    "e",
        factoryFqcn: "com.samsung.android.service.aircommand.remotespen" +
                     ".core.device.control.factory.rainbow.BleSpenRainbowFactory",
        label: "RAINBOW",
    },
    davinci: {
        safeEnum:    "e",
        factoryFqcn: "com.samsung.android.service.aircommand.remotespen" +
                     ".core.device.control.factory.davinci.BleSpenDavinciFactory",
        label: "DAVINCI",
    },
};

function specInfo() {
    return detectedSpec ? (SPEC_MAP[detectedSpec] || null) : null;
}

function makeFactory(fqcn) {
    try {
        return Java.use(fqcn).$new();
    } catch (e) {
        warn(`makeFactory("${fqcn}") failed: ${e.message}`);
        return null;
    }
}

/* ── name map (for REPL use) ──────────────────────────────────────────────── */
const NAME_MAP = {
    /* obfuscated class → readable */
    "z1.a":   "SpenModelName (enum)",
    "z1.a.c": "SpenModelName.NONBLE  (ordinal 0)",
    "z1.a.d": "SpenModelName.STICKY  (ordinal 1)",
    "z1.a.e": "SpenModelName.BUILTIN (ordinal 2)",
    "z1.a.f": "SpenModelName.PRO     (ordinal 3) EJ-P5450",
    "b3.d":   "BleSpenDeviceFactory",
    "b3.a":   "BleSpenBuiltinFactory",
    "b3.c":   "BleSpenExt1Factory",
    "b3.e":   "BleSpenStickyFactory",
    "x1.f":   "ModelFeatures",
    "N1.a":   "DeviceFeatures",
    "N1.a.k": "DeviceFeatures.BLE_SPEN_SPECS",
    "N1.a.l": "DeviceFeatures.S_PEN_GARAGE_SPEC",
    "C1.b":   "Assert",
    "D2.a":   "BleSpenUuid",
    "k3.a":   "WacomChargingDriver",
    "V2.i":   "BleSpenGenericDriver",
    "V2.b":   "BleSpenBleDriver",
    "V2.d":   "BleSpenBuiltinDriver",
    "V2.e":   "FirmwareUpgradeDriver",
    "V2.g":   "BleSpenExt1Driver",
    "V2.j":   "BleSpenStickyDriver",
    "I2.c":   "SpenModelName switch-map table",
    "T2.h":   "BleSpenInstanceId",
    "h2.e":   "SpenInstanceIdHelper",
    "F2.a":   "BleSpenBlindChargeController",
    "n5.a":   "Log",
    /* method shortcuts */
    "x1.f.a()":       "ModelFeatures.isBundledSpenSupportBle()",
    "x1.f.c()":       "ModelFeatures.getSpenModelName()",
    "b3.d.a()":       "BleSpenDeviceFactory.createBleSpenDriver()",
    "b3.d.c(z1.a)":   "BleSpenDeviceFactory.getInstance(SpenModelName)",
    "k3.a.c()":       "WacomChargingDriver.resetSpen()",
    "k3.a.e()":       "WacomChargingDriver.startCharge()",
    "k3.a.f()":       "WacomChargingDriver.startContinuousCharge()",
    "k3.a.g()":       "WacomChargingDriver.stopCharge()",
};

/* ════════════════════════════════════════════════════════════════════════════
 * Hook 1 — N1.a.<init>  (DeviceFeatures constructor)
 *
 * Fires very early.  We read BLE_SPEN_SPECS (field k) right after the
 * object is constructed so detectedSpec is populated before getSpenModelName.
 * ════════════════════════════════════════════════════════════════════════════*/
function hook1_DeviceFeatures() {
    const Cls = tryUse("N1.a");
    if (!Cls) return;

    // Try no-arg constructor first, then fall back to any constructor
    let hooked = false;

    const tryHookInit = (overloadArgs) => {
        if (hooked) return;
        try {
            const m = overloadArgs
                ? Cls.$init.overload(...overloadArgs)
                : Cls.$init;
            m.implementation = function () {
                // Call through first so fields are initialised
                m.apply(this, arguments);
                try {
                    const specs = this.k.value;
                    if (specs && specs.length > 0) {
                        detectedSpec = specs.toLowerCase().trim();
                        log(`Hook1 DeviceFeatures: BLE_SPEN_SPECS="${detectedSpec}"`);
                    }
                } catch (e) { dbg(`Hook1 field read: ${e.message}`); }
            };
            hooked = true;
            log(`✓ Hook 1: DeviceFeatures.<init>${overloadArgs ? "(" + overloadArgs + ")" : ""}`);
        } catch (e) { /* try next */ }
    };

    tryHookInit(null);                    // no-arg
    tryHookInit(["android.content.Context"]);  // common single-arg pattern
    if (!hooked) warn("Hook 1: could not hook DeviceFeatures.<init>");
}

/* ════════════════════════════════════════════════════════════════════════════
 * Hook 2 — x1.f.c()  (getSpenModelName)
 *
 * The crash origin.  We read the spec string, populate detectedSpec,
 * and return a safe existing enum constant instead of null / crashing.
 * ════════════════════════════════════════════════════════════════════════════*/
function hook2_GetSpenModelName() {
    const ModelFeatures = tryUse("x1.f");
    const SpenModelName = tryUse("z1.a");
    if (!ModelFeatures || !SpenModelName) return;

    ModelFeatures.c.implementation = function () {

        /* ── 1. BLE support check (mirrors original first lines) ── */
        let bleSupported = false;
        try { bleSupported = this.b.value.b.value; } catch (e) { /* flag field */ }

        if (!bleSupported) {
            dbg("getSpenModelName: BLE flag=false → NONBLE");
            return SpenModelName.c.value;   // NONBLE
        }

        /* ── 2. Read spec string ── */
        let spec = null;
        try {
            // x1.f.a is a V0.e config object; its field c is the spec string
            spec = this.a.value.c.value;
        } catch (e) { dbg(`getSpenModelName spec read: ${e.message}`); }

        if (spec && spec.length > 0) {
            detectedSpec = spec.toLowerCase().trim();
        }

        log(`getSpenModelName: spec="${detectedSpec}"  ble=${bleSupported}`);

        /* ── 3. Return safe enum for known new models ── */
        const info = specInfo();
        if (info) {
            const safeEnumVal = SpenModelName[info.safeEnum].value;
            log(`✓ Returning safe enum "${info.safeEnum}" (${NAME_MAP["z1.a." + info.safeEnum]}) for ${info.label}`);
            return safeEnumVal;
        }

        /* ── 4. Unknown / original model — call through ── */
        dbg(`Unrecognised spec "${detectedSpec}" — calling original`);
        return this.c();
    };

    log("✓ Hook 2: getSpenModelName (x1.f.c)");
}

/* ════════════════════════════════════════════════════════════════════════════
 * Hook 3 — x1.f.a()  (isBundledSpenSupportBle)
 *
 * Some device configs return false for unrecognised pen models.
 * Force true when we know the spec is a new supported model.
 * ════════════════════════════════════════════════════════════════════════════*/
function hook3_IsBundledSpenSupportBle() {
    const ModelFeatures = tryUse("x1.f");
    if (!ModelFeatures) return;

    ModelFeatures.a.implementation = function () {
        const original = this.a();
        const info = specInfo();
        if (!original && info) {
            log(`isBundledSpenSupportBle: original=false, forcing true for ${info.label}`);
            return true;
        }
        dbg(`isBundledSpenSupportBle → ${original}`);
        return original;
    };

    log("✓ Hook 3: isBundledSpenSupportBle (x1.f.a)");
}

/* ════════════════════════════════════════════════════════════════════════════
 * Hook 4 — androidx.core.view.n.n(z1.a)  (createSpenFactory)
 *
 * This is where the factory object is constructed.  The enum value coming
 * in will be the safe placeholder we returned in Hook 2.  We ignore it and
 * use detectedSpec to build the real new factory class.
 * ════════════════════════════════════════════════════════════════════════════*/
function hook4_CreateSpenFactory() {
    const ReflectorCls = tryUse("androidx.core.view.n");
    if (!ReflectorCls) return;

    const doHook = (method) => {
        method.implementation = function (spenModelName) {
            const info = specInfo();
            if (info) {
                log(`createSpenFactory: intercepting for ${info.label}`);
                const factory = makeFactory(info.factoryFqcn);
                if (factory) {
                    log(`✓ Returned ${info.factoryFqcn.split(".").pop()}`);
                    return factory;
                }
                warn(`Real factory unavailable — falling through to original`);
            }
            return method.call(this, spenModelName);
        };
    };

    // Try typed overload first, then untyped
    let hooked = false;
    try {
        doHook(ReflectorCls.n.overload("z1.a"));
        hooked = true;
        log("✓ Hook 4: createSpenFactory overload(z1.a)");
    } catch (e) { /* try plain */ }

    if (!hooked) {
        try {
            doHook(ReflectorCls.n);
            log("✓ Hook 4: createSpenFactory (plain)");
        } catch (e) {
            warn(`Hook 4 failed: ${e.message}`);
        }
    }
}

/* ════════════════════════════════════════════════════════════════════════════
 * Hook 5 — b3.d.c(z1.a)  (BleSpenDeviceFactory.getInstance)
 *
 * Belt-and-suspenders: ensures the factory map has the right entry.
 * ════════════════════════════════════════════════════════════════════════════*/
function hook5_GetInstance() {
    const FactoryBase = tryUse("b3.d");
    if (!FactoryBase) return;

    try {
        FactoryBase.c.implementation = function (spenModelName) {
            const info = specInfo();
            if (info) {
                dbg(`getInstance: spec="${detectedSpec}" → try cached factory`);

                // Check the HashMap first
                try {
                    const map = this.a.value;
                    if (map && map.containsKey(spenModelName)) {
                        const cached = map.get(spenModelName);
                        if (cached) { dbg("getInstance: returning cached"); return cached; }
                    }
                    // Not cached — create and store
                    const factory = makeFactory(info.factoryFqcn);
                    if (factory) {
                        if (map) map.put(spenModelName, factory);
                        log(`✓ getInstance: created + cached ${info.label} factory`);
                        return factory;
                    }
                } catch (e) {
                    dbg(`getInstance map access: ${e.message}`);
                }
            }
            return this.c(spenModelName);
        };
        log("✓ Hook 5: getInstance (b3.d.c)");
    } catch (e) {
        warn(`Hook 5 failed: ${e.message}`);
    }
}

/* ════════════════════════════════════════════════════════════════════════════
 * Hook 6 — C1.b.c(Object)  (Assert.notNull)
 *
 * Any null that slips through will hit this before crashing.
 * Log the stack trace so you can see exactly where it came from.
 * ════════════════════════════════════════════════════════════════════════════*/
function hook6_AssertNotNull() {
    const Assert = tryUse("C1.b");
    if (!Assert) return;

    try {
        Assert.c.implementation = function (obj) {
            if (obj === null || obj === undefined) {
                const AndroidLog = Java.use("android.util.Log");
                const Exception  = Java.use("java.lang.Exception");
                warn("Assert.notNull received NULL — stack trace:");
                warn(AndroidLog.getStackTraceString(Exception.$new("null check")));
            }
            return this.c(obj);
        };
        log("✓ Hook 6: Assert.notNull (C1.b.c)");
    } catch (e) {
        warn(`Hook 6 failed: ${e.message}`);
    }
}

/* ════════════════════════════════════════════════════════════════════════════
 * Entry
 * ════════════════════════════════════════════════════════════════════════════*/
Java.perform(function () {
    log("══════════════════════════════════════════════");
    log("  AirCommand BLE Legacy S-Pen Patch  v2.0    ");
    log("  Run with:  frida -U -f <package> -l <this> ");
    log("══════════════════════════════════════════════");

    if (detectedSpec) log(`FORCED_SPEC="${detectedSpec}"`);

    hook1_DeviceFeatures();       // read spec early
    hook2_GetSpenModelName();     // prevent crash, return safe enum
    hook3_IsBundledSpenSupportBle();
    hook4_CreateSpenFactory();    // swap in real factory
    hook5_GetInstance();          // cache in HashMap
    hook6_AssertNotNull();        // diagnose any remaining nulls

    log("══════════════════════════════════════════════");
    log("  Hooks armed.  Resuming...                  ");
    log("══════════════════════════════════════════════");

    // REPL helpers
    global.BLE              = { NAME_MAP, SPEC_MAP };
    global.getSpec          = () => detectedSpec;
    global.resolve          = (k) => NAME_MAP[k] || "unknown";
});