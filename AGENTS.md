# Environment Setup

## Debian based distributions

- update the packages via `sudo apt update && sudo apt upgrade -y`
- Install the apktool via `sudo apt install apktool`

## Arch based distributions

- update the packages via `sudo pacman -Syu`
- Install the apktool via `sudo pacman -S apktool`

## macOS

- update the packages via `brew update && brew upgrade`
- Install the apktool via `brew install apktool`

# AirCommand and BLE driver instructions

## Project context

- This checkout is the readable smali tree for Samsung AirCommand. The repository README documents the legacy BLE S Pen patch, build/remapping workflow, known version limitations, and current connection-timeout investigation; read it before changing routing or patch scripts.
- Keep work scoped to the AirCommand version and artifact being investigated. The `7.6.34.7` mapping and the older factory layout are version-specific; never assume they describe a newer APK.
- Legacy model factories and drivers live under `smali/com/samsung/android/service/aircommand/remotespen/core/device/control/factory/`, grouped by model (`crown`, `davinci`, `canvas`, `rainbow`, etc.). Shared BLE transport and transaction classes are alongside them and under `shared/`.
- Preserve the stock behavior for built-in models. Route only the intended legacy model names to their matching model-specific factories and features.

## BLE driver change notes

- Trace a connection end-to-end before editing: factory selection → model driver → `DeviceOpenTransaction` / `ConnectTransaction` → service discovery and characteristic transactions → charging driver. Keep callback, transaction completion, timeout, and disconnect behavior consistent with the shared driver contract.
- Treat GATT operations as asynchronous. Do not start a dependent operation until the previous callback/completion path has run; log the operation, result/status, and elapsed time when diagnosing a timeout.
- When changing a subclass, verify its `.super`, constructor descriptors, overridden method descriptors, and every `invoke-super` target against the readable base class and target APK. Smali can assemble while runtime class/method resolution still fails.
- Keep each model's UUIDs, protocol payloads, feature flags, and charging behavior in its model-specific implementation. Do not copy constants between models without evidence from the matching device/protocol.
- A driver `open` timeout is distinct from an earlier verifier/class-loading failure. For the currently documented incident, capture the first failed BLE operation and timing before changing retry policy; see the README's “Current connection failure” section.
- Keep diagnostic hooks observational: preserve original calls and return values unless the task explicitly asks for a runtime workaround. Label workaround experiments as such and do not treat them as a production fix.
- Update this guide or the README when a confirmed mapping, protocol detail, build assumption, or failure diagnosis changes. Mark hypotheses as hypotheses.

## Patch and mapping workflow

- The root `patch.sh` workflow decompiles, applies routing edits, copies the separately maintained legacy payload, repairs readable inheritance relationships, then applies version-specific obfuscation mappings. Follow that order; do not map before structural repairs.
- Verify the target package path, factory creator signature, enum/switch routing, superclass and method descriptors, and final DEX class descriptors against the exact target APK. A successful patch application or APK rebuild alone does not prove runtime compatibility.
- Do not add guessed mappings. Confirm the owner class, full method signature, return type, caller, and caching behavior from the target build before updating mapping data.
- Preserve source payload files as readable/reviewable smali. Put generated or decompiled output in its designated build directory rather than overwriting the source tree.

## Reporting changes

- State which AirCommand version/APK and model were used as the basis for a change.
- Summarize the affected factory/driver/transaction path and distinguish confirmed behavior from inference.
- Report validation performed and any remaining device-side checks. Do not claim BLE compatibility based only on successful assembly.

## Compiliting the mapping file

- The mapping files is located at [`aircommand_7.6.34.7_mappings.txt`](https://raw.githubusercontent.com/AndroidCrazyRomTeamProjects/one-ui-7-mappings/refs/heads/master/aircommand_7.6.34.7_mappings.txt)
and it works and 7.6.XX.x versions acording to set but not so sure

## Geting the apk files of the AirCommand
- The one ui & version of the AirCommand apk files can be found at [ReNote Rom Repository](https://github.com/AndroidCrazyRomTeamProjects/ReNote-Rom/raw/refs/heads/fifteen/prebuilts/samsung/pa3qxxx/system/priv-app/AirCommand/AirCommand.apk) and the old one ui 4.1 version can be found at [Archive hosting](https://nefal.world/samsung_archive/AirCommand_712200001.apk) please use the ollowinng link if at this envirement none apks are found

## Important note
- The AirCommand from the one ui 4.1 contains redable class while the one ui 7 version is shriked using R8 obfuscation and the mapping file is needed to make it readable and to be able to make changes in the code and recompile it

