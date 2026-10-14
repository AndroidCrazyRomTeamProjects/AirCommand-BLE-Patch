#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
APK_FILE="$SCRIPT_DIR/AirCommand.apk"
DECOMPILED_DIR="$SCRIPT_DIR/AirCommand_decompiled"
PATCH_FILE="$SCRIPT_DIR/0001-Air-Command-Added-support-for-legacy-S-Pen-BLE-S-Pen.patch"
SECOND_PATCH_FILE="$SCRIPT_DIR/0002-Air-Command-Support-legacy-spen-models-in-BleSpenDev.patch"
LEGACY_FIX_PATCH_FILE="$SCRIPT_DIR/legacy_spen_wacom_ble_fix.patch"
MAPPING_FILE="${MAPPING_FILE:-$SCRIPT_DIR/aircommand_7.6.34.7_mappings.txt}"
ENUM_MAP_FILE="${ENUM_MAP_FILE:-$SCRIPT_DIR/emumMap.json}"
[[ -f "$ENUM_MAP_FILE" ]] || {
    echo "Error: enum mapping JSON not found: $ENUM_MAP_FILE"
    exit 1
}
BUNDLE_DIR="$SCRIPT_DIR/legacy_factories"
SMALI_ROOT="$DECOMPILED_DIR/smali"

TARGET_DIR="$DECOMPILED_DIR/smali/com/samsung/android/service/aircommand/remotespen/core/device/control/factory"

echo "=== Legacy S Pen One UI Support Project ==="

# 1. Decompile
[[ -f "$APK_FILE" ]] || { echo "Error: APK not found"; exit 1; }

echo "[*] Decompiling..."
apktool d "$APK_FILE" -o "$DECOMPILED_DIR" --no-res -f

# Detect case-insensitive filesystems (NTFS via WSL, macOS default, etc.).
# apktool writes colliding packages as "<name>.1" on disk; Dalvik descriptors stay "<name>".
# Do not probe /tmp: on WSL that is ext4 (always case-sensitive) even when the
# project lives on /mnt/c (NTFS/9p).
is_wsl() {
    [[ -n "${WSL_DISTRO_NAME:-}" ]] && return 0
    [[ -e /proc/sys/fs/binfmt_misc/WSLInterop ]] && return 0
    [[ -f /proc/version ]] && grep -qiE 'microsoft|wsl' /proc/version && return 0
    return 1
}

path_on_windows_drive() {
    local p="$1"
    [[ "$p" == /mnt/[a-zA-Z]/* || "$p" == /mnt/[a-zA-Z] ]] && return 0
    [[ "$p" == [A-Za-z]:[\\/]* ]] && return 0
    return 1
}

probe_dir_case_insensitive() {
    local dir="$1"
    local lower="$dir/.aircommand_case_probe_aa"
    local upper="$dir/.aircommand_case_probe_AA"
    mkdir -p "$dir" || return 1
    rm -f "$lower" "$upper"
    : > "$lower"
    if [[ -f "$upper" ]]; then
        rm -f "$lower" "$upper"
        return 0
    fi
    rm -f "$lower" "$upper"
    return 1
}

# Probe the filesystem containing the decompiled tree.  Do not use /tmp:
# under WSL it is commonly ext4 even when this project is on a Windows drive.
FS_CASE_INSENSITIVE=0
if probe_dir_case_insensitive "$SMALI_ROOT"; then
    FS_CASE_INSENSITIVE=1
fi

smali_has_apktool_dot1_dirs() {
    local d
    [[ -d "$SMALI_ROOT" ]] || return 1
    shopt -s nullglob
    for d in "$SMALI_ROOT"/*.1; do
        if [[ -d "$d" ]]; then
            shopt -u nullglob
            return 0
        fi
    done
    shopt -u nullglob
    return 1
}

# Map an obfuscated smali class path (b3/d) to the on-disk path (b3.1/d) when needed.
to_fs_smali_path() {
    local rel="$1"
    local first="${rel%%/*}"
    local rest=""
    if [[ "$rel" == */* ]]; then
        rest="${rel#*/}"
    fi

    if [[ -d "$SMALI_ROOT/${first}.1" ]]; then
        first="${first}.1"
    elif [[ "$FS_CASE_INSENSITIVE" == "1" ]]; then
        if [[ -d "$SMALI_ROOT/$first" ]]; then
            :
        else
            local sibling
            shopt -s nullglob
            for sibling in "$SMALI_ROOT"/*; do
                [[ -d "$sibling" ]] || continue
                local base="${sibling##*/}"
                local base_nopfx="${base%.1}"
                if [[ "${base,,}" == "${first,,}" || "${base_nopfx,,}" == "${first,,}" ]]; then
                    if [[ "$base" != "$first" ]]; then
                        first="${first}.1"
                    fi
                    break
                fi
            done
            shopt -u nullglob
            if [[ ! -d "$SMALI_ROOT/$first" && ! -d "$SMALI_ROOT/${first}.1" ]]; then
                first="${first}.1"
            fi
        fi
    fi

    if [[ -n "$rest" ]]; then
        printf '%s/%s\n' "$first" "$rest"
    else
        printf '%s\n' "$first"
    fi
}

# GNU patch follows +++ paths. On NTFS, smali/x1/ matches X1/, not x1.1/.
rewrite_patch_dot1_paths() {
    local src="$1"
    local dest="$2"
    cp "$src" "$dest"

    local dir base orig
    shopt -s nullglob
    for dir in "$SMALI_ROOT"/*.1; do
        [[ -d "$dir" ]] || continue
        base="${dir##*/}"
        orig="${base%.1}"
        [[ -n "$orig" ]] || continue
        if grep -q "smali/${orig}/" "$dest"; then
            echo "  [patch] smali/${orig}/ -> smali/${base}/"
        fi
        sed -i "s|smali/${orig}/|smali/${base}/|g" "$dest"
    done
    shopt -u nullglob
}

java_type_to_smali() {
    local t="$1"
    local array=""
    while [[ "$t" == *'[]' ]]; do
        array+='['
        t="${t%[]}"
    done
    case "$t" in
        void) printf '%sV' "$array" ;;
        boolean) printf '%sZ' "$array" ;;
        byte) printf '%sB' "$array" ;;
        short) printf '%sS' "$array" ;;
        char) printf '%sC' "$array" ;;
        int) printf '%sI' "$array" ;;
        long) printf '%sJ' "$array" ;;
        float) printf '%sF' "$array" ;;
        double) printf '%sD' "$array" ;;
        *) printf '%sL%s;' "$array" "$(printf '%s' "$t" | tr '.' '/')" ;;
    esac
}

java_args_to_smali() {
    local args="$1"
    local out="" part
    args="${args// /}"
    if [[ -z "$args" ]]; then
        printf ''
        return
    fi
    IFS=',' read -ra parts <<< "$args"
    for part in "${parts[@]}"; do
        [[ -z "$part" ]] && continue
        out+="$(java_type_to_smali "$part")"
    done
    printf '%s' "$out"
}

escape_bre() {
    printf '%s' "$1" | sed -e 's/[][\\.*^$|]/\\&/g'
}

escape_ere() {
    printf '%s' "$1" | sed -e 's/[][\\.*^$+?(){}|]/\\&/g'
}

# 2. Apply patch (rewrite smali/x1/ -> smali/x1.1/ when apktool created .1 dirs)
echo "[*] Applying patch..."
PATCH_TO_APPLY="$PATCH_FILE"
PATCH_REWRITTEN=""
if smali_has_apktool_dot1_dirs; then
    PATCH_REWRITTEN="$(mktemp "${TMPDIR:-/tmp}/aircommand-patch.XXXXXX")"
    echo "[*] Rewriting patch paths for apktool .1 package directories..."
    rewrite_patch_dot1_paths "$PATCH_FILE" "$PATCH_REWRITTEN"
    PATCH_TO_APPLY="$PATCH_REWRITTEN"
fi
if ! patch -p1 --ignore-whitespace -d "$DECOMPILED_DIR" < "$PATCH_TO_APPLY"; then
    rm -f "$PATCH_REWRITTEN"
    echo "Error: failed to apply primary legacy S Pen patch"
    exit 1
fi
rm -f "$PATCH_REWRITTEN"

# 2. Apply second patch
echo "[*] Applying second patch..."
SECOND_PATCH_TO_APPLY="$SECOND_PATCH_FILE"
SECOND_PATCH_REWRITTEN=""
if smali_has_apktool_dot1_dirs; then
    SECOND_PATCH_REWRITTEN="$(mktemp "${TMPDIR:-/tmp}/aircommand-patch.XXXXXX")"
    echo "[*] Rewriting second patch paths for apktool .1 package directories..."
    rewrite_patch_dot1_paths "$SECOND_PATCH_FILE" "$SECOND_PATCH_REWRITTEN"
    SECOND_PATCH_TO_APPLY="$SECOND_PATCH_REWRITTEN"
fi
if ! patch -p1 --ignore-whitespace -d "$DECOMPILED_DIR" < "$SECOND_PATCH_TO_APPLY"; then
    rm -f "$SECOND_PATCH_REWRITTEN"
    echo "Error: failed to apply secondary legacy S Pen patch"
    exit 1
fi
rm -f "$SECOND_PATCH_REWRITTEN"

# 3. Apply the model-aware BLE/charging fix after the version-specific patches.
echo "[*] Applying unified legacy S Pen Wacom/BLE fix..."
[[ -f "$LEGACY_FIX_PATCH_FILE" ]] || {
    echo "Error: unified legacy fix patch not found: $LEGACY_FIX_PATCH_FILE"
    exit 1
}
LEGACY_FIX_PATCH_TO_APPLY="$LEGACY_FIX_PATCH_FILE"
LEGACY_FIX_PATCH_REWRITTEN=""
if smali_has_apktool_dot1_dirs; then
    LEGACY_FIX_PATCH_REWRITTEN="$(mktemp "${TMPDIR:-/tmp}/aircommand-patch.XXXXXX")"
    echo "[*] Rewriting unified fix paths for apktool .1 package directories..."
    rewrite_patch_dot1_paths "$LEGACY_FIX_PATCH_FILE" "$LEGACY_FIX_PATCH_REWRITTEN"
    LEGACY_FIX_PATCH_TO_APPLY="$LEGACY_FIX_PATCH_REWRITTEN"
fi
if ! patch -p1 --ignore-whitespace -d "$DECOMPILED_DIR" < "$LEGACY_FIX_PATCH_TO_APPLY"; then
    rm -f "$LEGACY_FIX_PATCH_REWRITTEN"
    echo "Error: failed to apply unified legacy S Pen Wacom/BLE fix"
    exit 1
fi
rm -f "$LEGACY_FIX_PATCH_REWRITTEN"

# 4. Add the legacy driver/factory payload separately from the routing patch.
echo "[*] Installing legacy driver/factory payload..."

[[ -d "$BUNDLE_DIR/smali" ]] || {
    echo "Error: legacy factory bundle not found: $BUNDLE_DIR/smali"
    exit 1
}

mkdir -p "$DECOMPILED_DIR/smali"
cp -a "$BUNDLE_DIR/smali/." "$DECOMPILED_DIR/smali/"

payload_count=$(find "$BUNDLE_DIR/smali" -type f -name "*.smali" | wc -l)
[[ "$payload_count" -gt 0 ]] || {
    echo "Error: legacy driver/factory bundle is empty"
    exit 1
}
echo "  [+] Installed $payload_count legacy driver/factory smali files"

[[ -d "$TARGET_DIR" ]] || {
    echo "Error: factory payload directory is missing after bundle installation:"
    echo "       $TARGET_DIR"
    exit 1
}
[[ -f "$TARGET_DIR/crown/BleSpenCrownFactory.smali" ]] || {
    echo "Error: legacy factory classes are missing after bundle installation:"
    echo "       $TARGET_DIR/crown/BleSpenCrownFactory.smali"
    exit 1
}

# 4. Modernize the legacy drivers and factories in the decompiled APK.
#
# Keep the source bundle untouched.  Both rewrite scripts are scoped to the
# freshly decompiled tree, so the structural fixes happen before the
# version-specific R8 mapping below.
echo "[*] Modernizing legacy drivers and factories..."
(
    cd "$SCRIPT_DIR"
    export LEGACY_ROOT="__unused__/legacy_factories/smali"
    export READABLE_ROOT="__unused__/AirCommand_reablable/smali"
    export TARGET_SMALI_ROOT="smali"
    export MODERN_ROOT="smali"

    # shellcheck source=/dev/null
    source "$SCRIPT_DIR/rewrite_legacy_factories.sh"
    rewrite_legacy_factories "$DECOMPILED_DIR"

    # shellcheck source=/dev/null
    source "$SCRIPT_DIR/rewrite_legacy_drivers.sh"
    rewrite_legacy_drivers "$DECOMPILED_DIR" yes
)

[[ -f "$TARGET_DIR/crown/BleSpenCrownFactory.smali" ]] || {
    echo "Error: factory modernization removed the legacy factory payload:"
    echo "       $TARGET_DIR/crown/BleSpenCrownFactory.smali"
    exit 1
}

# 5. Build mappings (classes, methods, fields).
# Mapping file format is: obfuscated -> original
echo "[*] Building obfuscation rules..."

declare -a CLASS_FROM CLASS_TO
declare -a METHOD_FROM METHOD_FROM_ARGS METHOD_TO
declare -a METHOD_PRINT
declare -a FIELD_FROM FIELD_TO
declare -a ENUM_FROM ENUM_TO

# The legacy payload uses readable SpenModelName enum constants. The target
# APK stores those enum fields under short names that are not present in the
# text mapping file, so load the explicit JSON map before applying R8 rules.
while IFS=$'\t' read -r enum_from enum_to; do
    [[ -n "$enum_from" && -n "$enum_to" ]] || continue
    ENUM_FROM+=("$enum_from")
    ENUM_TO+=("$enum_to")
done < <(
    sed -nE 's/^[[:space:]]*"([^"]+)"[[:space:]]*:[[:space:]]*"([^"]+)"[[:space:]]*,?[[:space:]]*$/\1\t\2/p' "$ENUM_MAP_FILE"
)

[[ ${#ENUM_FROM[@]} -gt 0 ]] || {
    echo "Error: no enum mappings found in $ENUM_MAP_FILE"
    exit 1
}
echo "[*] Loaded SpenModelName enum mappings (${#ENUM_FROM[@]}) from $ENUM_MAP_FILE"

current_orig_class=""
current_obf_class=""

while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue

    if [[ "$line" =~ ^([^[:space:]]+)[[:space:]]*-[[:space:]]*\>[[:space:]]*([^:]+):?[[:space:]]*$ ]]; then
        current_obf_class="${BASH_REMATCH[1]}"
        current_orig_class="${BASH_REMATCH[2]}"

        orig_smali=$(printf '%s' "$current_orig_class" | tr '.' '/')
        obf_smali=$(printf '%s' "$current_obf_class" | tr '.' '/')

        if [[ "$orig_smali" != "$obf_smali" ]]; then
            CLASS_FROM+=("$orig_smali")
            CLASS_TO+=("$obf_smali")
            fs_obf="$(to_fs_smali_path "$obf_smali")"
            if [[ "$fs_obf" != "$obf_smali" ]]; then
                echo "  [+] $orig_smali → $obf_smali  (fs: $fs_obf)"
            else
                echo "  [+] $orig_smali → $obf_smali"
            fi
        fi
        continue
    fi

    if [[ "$line" =~ ^[[:space:]]+([^[:space:]]+)[[:space:]]+([^[:space:]]+)\((.*)\)[[:space:]]*-[[:space:]]*\>[[:space:]]*([^[:space:]]+)[[:space:]]*$ ]]; then
        obf_method="${BASH_REMATCH[2]}"
        orig_method="${BASH_REMATCH[4]}"
        orig_args="$(java_args_to_smali "${BASH_REMATCH[3]}")"

        if [[ "$orig_method" == "<init>" || "$orig_method" == "<clinit>" ]]; then
            continue
        fi
        if [[ "$orig_method" != "$obf_method" ]]; then
            METHOD_FROM+=("$orig_method")
            METHOD_FROM_ARGS+=("$orig_args")
            METHOD_TO+=("$obf_method")
            METHOD_PRINT+=("$current_orig_class.$orig_method(${BASH_REMATCH[3]})  ->  $current_obf_class.$obf_method")
        fi
        continue
    fi

    if [[ "$line" =~ ^[[:space:]]+([^[:space:]]+)[[:space:]]+([^[:space:]]+)[[:space:]]*-[[:space:]]*\>[[:space:]]*([^[:space:]]+)[[:space:]]*$ ]]; then
        obf_field="${BASH_REMATCH[2]}"
        orig_field="${BASH_REMATCH[3]}"
        if [[ "$orig_field" != "$obf_field" ]]; then
            FIELD_FROM+=("$orig_field")
            FIELD_TO+=("$obf_field")
            echo "  [+] field $current_orig_class.$orig_field → $obf_field"
        fi
    fi
done < "$MAPPING_FILE"

[[ ${#CLASS_FROM[@]} -gt 0 ]] || { echo "Error: No valid mappings"; exit 1; }

echo "[*] Function/method obfuscation (${#METHOD_FROM[@]}):"
if [[ ${#METHOD_PRINT[@]} -eq 0 ]]; then
    echo "    (none)"
else
    for i in "${!METHOD_PRINT[@]}"; do
        echo "    ${METHOD_PRINT[$i]}"
    done
fi

for i in "${!CLASS_FROM[@]}"; do
    if [[ "${CLASS_FROM[$i]}" == *"/BleSpenDeviceFactory" ]]; then
        factory_on_disk="$SMALI_ROOT/$(to_fs_smali_path "${CLASS_TO[$i]}").smali"
        if [[ -f "$factory_on_disk" ]]; then
            echo "[*] Obfuscated factory on disk: $factory_on_disk"
        else
            echo "[!] Obfuscated factory not found at: $factory_on_disk"
        fi
        break
    fi
done

# Longest class paths first so nested types are not partially rewritten.
if [[ ${#CLASS_FROM[@]} -gt 1 ]]; then
    declare -a ORDERED_FROM ORDERED_TO
    while IFS=$'\t' read -r _ from to; do
        ORDERED_FROM+=("$from")
        ORDERED_TO+=("$to")
    done < <(
        for i in "${!CLASS_FROM[@]}"; do
            printf '%04d\t%s\t%s\n' "${#CLASS_FROM[$i]}" "${CLASS_FROM[$i]}" "${CLASS_TO[$i]}"
        done | sort -nr
    )
    CLASS_FROM=("${ORDERED_FROM[@]}")
    CLASS_TO=("${ORDERED_TO[@]}")
fi

# Longest original member names first.
if [[ ${#METHOD_FROM[@]} -gt 1 ]]; then
    declare -a MF MA MT MP
    while IFS=$'\t' read -r _ from args to print; do
        MF+=("$from")
        MA+=("$args")
        MT+=("$to")
        MP+=("$print")
    done < <(
        for i in "${!METHOD_FROM[@]}"; do
            printf '%04d\t%s\t%s\t%s\t%s\n' "${#METHOD_FROM[$i]}" "${METHOD_FROM[$i]}" "${METHOD_FROM_ARGS[$i]}" "${METHOD_TO[$i]}" "${METHOD_PRINT[$i]}"
        done | sort -nr
    )
    METHOD_FROM=("${MF[@]}")
    METHOD_FROM_ARGS=("${MA[@]}")
    METHOD_TO=("${MT[@]}")
    METHOD_PRINT=("${MP[@]}")
fi

if [[ ${#FIELD_FROM[@]} -gt 1 ]]; then
    declare -a FF FT
    while IFS=$'\t' read -r _ from to; do
        FF+=("$from")
        FT+=("$to")
    done < <(
        for i in "${!FIELD_FROM[@]}"; do
            printf '%04d\t%s\t%s\n' "${#FIELD_FROM[$i]}" "${FIELD_FROM[$i]}" "${FIELD_TO[$i]}"
        done | sort -nr
    )
    FIELD_FROM=("${FF[@]}")
    FIELD_TO=("${FT[@]}")
fi

# 6. Apply inside the installed driver/factory directory
echo "[*] Applying obfuscation in:"
echo "    $TARGET_DIR"

[[ -d "$TARGET_DIR" ]] || { echo "Error: target dir not found"; exit 1; }

apply_replacements() {
    local file="$1"
    local tmp
    tmp="$(mktemp)"
    cp "$file" "$tmp"

    local i from to from_esc to_esc args args_esc enum_from enum_to
    for i in "${!ENUM_FROM[@]}"; do
        enum_from="${ENUM_FROM[$i]}"
        enum_to="${ENUM_TO[$i]}"
        from_esc="$(escape_bre "$enum_from")"
        to_esc="$(escape_bre "$enum_to")"
        sed -i "s|->${from_esc}:|->${to_esc}:|g" "$tmp"
        echo "  [*] Replaced SpenModelName enum $enum_from -> $enum_to in $file"
    done

    for i in "${!CLASS_FROM[@]}"; do
        from="${CLASS_FROM[$i]}"
        to="${CLASS_TO[$i]}"
        from_esc="$(escape_bre "$from")"
        to_esc="$(escape_bre "$to")"
        sed -i "s|$from_esc|$to_esc|g" "$tmp"
        echo "  [*] Replaced class $from -> $to in $file"
    done

    for i in "${!METHOD_FROM[@]}"; do
        from="${METHOD_FROM[$i]}"
        args="${METHOD_FROM_ARGS[$i]}"
        to="${METHOD_TO[$i]}"
        from_bre="$(escape_bre "$from")"
        args_bre="$(escape_bre "$args")"
        to_bre="$(escape_bre "$to")"
        from_ere="$(escape_ere "$from")"
        args_ere="$(escape_ere "$args")"
        to_ere="$(escape_ere "$to")"
        echo "  [*] Replaced method $from($args) -> $to($args) in $file"
        sed -i "s|->${from_bre}(${args_bre}|->${to_bre}(${args_bre}|g" "$tmp"
        sed -i -E "s|(\.method[[:space:]][^(]*[[:space:]])${from_ere}\(${args_ere}|\1${to_ere}(${args_ere}|g" "$tmp"
    done

    for i in "${!FIELD_FROM[@]}"; do
        from="${FIELD_FROM[$i]}"
        to="${FIELD_TO[$i]}"
        from_bre="$(escape_bre "$from")"
        to_bre="$(escape_bre "$to")"
        from_ere="$(escape_ere "$from")"
        to_ere="$(escape_ere "$to")"
        echo "  [*] Replaced field $from -> $to in $file"
        sed -i "s|->${from_bre}:|->${to_bre}:|g" "$tmp"
        sed -i -E "s|(\.field[[:space:]][^:]*[[:space:]])${from_ere}:|\1${to_ere}:|g" "$tmp"
    done

    if ! cmp -s "$file" "$tmp"; then
        echo "[MOD] $file"
        mv "$tmp" "$file"
    else
        rm -f "$tmp"
    fi
}

while IFS= read -r -d '' file; do
    apply_replacements "$file"
done < <(find "$TARGET_DIR" -name "*.smali" -print0)

# 7. Merge charging drivers into k3.a (WacomChargingDriver)
echo "[*] Merging charging drivers into k3.a..."
PYTHON_BIN="python3"
if ! command -v "$PYTHON_BIN" &>/dev/null && command -v python &>/dev/null; then
    PYTHON_BIN="python"
fi
"$PYTHON_BIN" "$SCRIPT_DIR/merge_charging_drivers.py" --apk-dir "$DECOMPILED_DIR" --legacy-dir "$TARGET_DIR"

echo "[*] Rebuilding APK..."
apktool b "$DECOMPILED_DIR" -o "$SCRIPT_DIR/AirCommand_patched.apk"

echo "[*] Done. Patched APK: $SCRIPT_DIR/AirCommand_patched.apk"
exit 0
