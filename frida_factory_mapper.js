/*
 * AirCommand factory mapping helper
 *
 * Read-only Frida helper for newer AirCommand builds. It does not patch
 * methods, create factories, or change enum values. Its purpose is to find
 * the factory creator that is missing from the historical mapping.
 *
 * Usage:
 *   frida -U -f com.samsung.android.service.aircommand \
 *     -l frida_factory_mapper.js --no-pause
 */
"use strict";

const TAG = "[FACTORY-MAP]";
const seenClasses = {};
const hookedMethods = {};

function out(message) {
    console.log(`${TAG} ${message}`);
}

function warn(message) {
    console.error(`${TAG} WARN ${message}`);
}

function isInterestingClass(name) {
    const value = name.toLowerCase();
    return value.includes("factory") ||
        value.includes("remotespen") ||
        value.includes("spenmodel") ||
        value.includes("devicefeature");
}

function safeTypeName(type) {
    try {
        return type.getName().toString();
    } catch (e) {
        return "<unknown-type>";
    }
}

function typeLooksLikeFactory(type) {
    try {
        let current = type;
        for (let i = 0; current && i < 8; i++) {
            const name = safeTypeName(current).toLowerCase();
            if (name.includes("factory")) {
                return true;
            }
            current = current.getSuperclass();
        }
    } catch (e) {
        return false;
    }
    return false;
}

function dumpClass(name) {
    if (seenClasses[name]) {
        return;
    }
    seenClasses[name] = true;

    try {
        const klass = Java.use(name);
        const reflected = klass.class;
        const superclass = reflected.getSuperclass();
        out(`CLASS ${name} SUPER ${superclass ? safeTypeName(superclass) : "<none>"}`);

        const methods = reflected.getDeclaredMethods();
        for (let i = 0; i < methods.length; i++) {
            const method = methods[i];
            const parameters = method.getParameterTypes();
            const args = [];
            for (let j = 0; j < parameters.length; j++) {
                args.push(safeTypeName(parameters[j]));
            }
            const returnType = safeTypeName(method.getReturnType());
            const signature = `${returnType} ${method.getName()}(${args.join(", ")})`;
            if (method.getName().toLowerCase().includes("factory") ||
                typeLooksLikeFactory(method.getReturnType()) ||
                name.toLowerCase().includes("factory")) {
                out(`  METHOD ${signature}`);
            }
        }
    } catch (e) {
        warn(`class ${name}: ${e}`);
    }
}

function stackTrace() {
    try {
        const Log = Java.use("android.util.Log");
        const Exception = Java.use("java.lang.Exception");
        return Log.getStackTraceString(Exception.$new("factory mapper call"));
    } catch (e) {
        return `<stack unavailable: ${e}>`;
    }
}

function hookCandidate(name) {
    try {
        const klass = Java.use(name);
        const methods = klass.class.getDeclaredMethods();

        for (let i = 0; i < methods.length; i++) {
            const reflectedMethod = methods[i];
            const methodName = reflectedMethod.getName().toString();
            const methodLower = methodName.toLowerCase();
            if (!methodLower.includes("factory") &&
                !typeLooksLikeFactory(reflectedMethod.getReturnType())) {
                continue;
            }

            const overloads = klass[methodName].overloads;
            for (let j = 0; j < overloads.length; j++) {
                const overload = overloads[j];
                const key = `${name}.${methodName}.${j}`;
                if (hookedMethods[key]) {
                    continue;
                }
                hookedMethods[key] = true;

                overload.implementation = function () {
                    const args = [];
                    for (let k = 0; k < arguments.length; k++) {
                        args.push(arguments[k] === null || arguments[k] === undefined
                            ? null
                            : String(arguments[k]));
                    }
                    out(`CALL ${key} RETURN ${overload.returnType.name}`);
                    out(`ARGS ${JSON.stringify(args)}`);
                    out(stackTrace());

                    // Preserve behavior: invoke the original overload exactly once.
                    return overload.call(this, ...arguments);
                };
            }
        }
    } catch (e) {
        warn(`hook ${name}: ${e}`);
    }
}

function scanLoadedClasses() {
    Java.enumerateLoadedClasses({
        onMatch: function (name) {
            if (!isInterestingClass(name)) {
                return;
            }
            dumpClass(name);
            hookCandidate(name);
        },
        onComplete: function () {
            out("Class inventory pass complete");
        }
    });
}

Java.perform(function () {
    out("Starting read-only factory discovery");
    out("No enum values or factory implementations will be changed");
    scanLoadedClasses();
    // Classes may load lazily after Application.onCreate.
    setTimeout(scanLoadedClasses, 1000);
    setTimeout(scanLoadedClasses, 3000);
    setTimeout(scanLoadedClasses, 7000);
    out("Trigger AirCommand startup and retain all CALL records");
});
