#!/bin/bash
# =============================================================================
# rewrite_legacy_drivers.sh
#
# Structural rewrite of legacy BleSpen*Driver smali so they verify and run
# when dropped into a modern (R8-optimised) AirCommand tree.
#
# Modern tree for this project:  AirCommand_7.6.34.7
# Legacy / readable source:      AirCommand_reablable  or  legacy_factories
#
# What this script does (version-agnostic, NO mapping-dependent renames):
#   1. Optionally injects the BleSpenDriver base class if missing
#   2. Fixes invoke-super that incorrectly target BleSpenDriver instead of
#      the class's declared direct superclass  → eliminates VerifyError
#   3. Strips CRLF
#
# Method / type names are LEFT UNCHANGED.  patch.sh applies the correct
# R8 mapping for each major AirCommand version later.
#
# Usage:
#   ./rewrite_legacy_drivers.sh [target_dir] [inject_base=yes|no]
#   source rewrite_legacy_drivers.sh && rewrite_legacy_drivers [dir] [yes|no]
# =============================================================================

set -euo pipefail

LEGACY_ROOT="${LEGACY_ROOT:-legacy_factories/smali}"
READABLE_ROOT="${READABLE_ROOT:-AirCommand_reablable/smali}"
TARGET_SMALI_ROOT="${TARGET_SMALI_ROOT:-smali}"          # or AirCommand_7.6.34.7/smali
MODERN_ROOT="${MODERN_ROOT:-AirCommand_7.6.34.7/smali}"

BASE_REL="com/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver"

# ---------------------------------------------------------------------------
get_super() {
    local f="$1"
    grep -m1 '^\.super ' "$f" 2>/dev/null | tr -d '\r' | sed -E 's/^\.super L//;s/;$//' || true
}

# ---------------------------------------------------------------------------
rewrite_one_driver() {
    local file="$1"

    # Normalise line endings
    sed -i 's/\r$//' "$file" 2>/dev/null || true

    local super
    super=$(get_super "$file")

    if [[ -z "$super" ]]; then
        echo "  [SKIP] no .super → $(basename "$file")"
        return 0
    fi

    # Only touch the known driver hierarchy
    case "$super" in
        *"/BleSpenGenericDriver"|*"/BleSpenCanvasDriver"|*"/BleSpenDavinciDriver"| \
        *"/BleSpenCrownDriver"|*"/BleSpenRainbowDriver"|*"/BleSpenDriver")
            ;;
        *)
            echo "  [SKIP] unknown hierarchy (super=$super) → $(basename "$file")"
            return 0
            ;;
    esac

    echo "  [FIX ] $(basename "$(dirname "$file")")/$(basename "$file")  (super = $super)"

    # ------------------------------------------------------------------
    # Fix invoke-super / invoke-super/range that still point at the
    # top-level BleSpenDriver instead of the declared direct superclass.
    # This is the classic decompiler mistake that causes VerifyError.
    # Method names themselves are NOT changed.
    # ------------------------------------------------------------------
    sed -i -E \
        "s|(invoke-super(/range)? \{[^}]+\}), Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->|\1, L${super};->|g" \
        "$file"

    # Tidy .source
    local simple
    simple=$(basename "$file" .smali)
    sed -i "s|^\.source \".*\"|.source \"${simple}.java\"|" "$file"
}

# ---------------------------------------------------------------------------
rewrite_legacy_drivers() {
    local target_dir="${1:-.}"
    local inject_base="${2:-yes}"

    echo "============================================================"
    echo " rewrite_legacy_drivers"
    echo " target_dir   = $target_dir"
    echo " inject_base  = $inject_base"
    echo " LEGACY_ROOT  = $LEGACY_ROOT"
    echo " TARGET_ROOT  = $TARGET_SMALI_ROOT"
    echo " MODERN_ROOT  = $MODERN_ROOT"
    echo "============================================================"
    echo
    echo "NOTE: Method/type names are left untouched."
    echo "      Mapping is applied later by patch.sh."
    echo

    # ------------------------------------------------------------------
    # 0. Inject BleSpenDriver base class when missing
    # ------------------------------------------------------------------
    if [[ "$inject_base" =~ ^(yes|true|1)$ ]]; then
        local dst_base=""
        # Prefer modern tree, then generic target
        for candidate_dst in \
            "${target_dir}/${MODERN_ROOT}/${BASE_REL}.smali" \
            "${target_dir}/${TARGET_SMALI_ROOT}/${BASE_REL}.smali"
        do
            dst_base="$candidate_dst"
            break
        done

        if [[ -f "$dst_base" ]]; then
            echo "==> BleSpenDriver already present at $dst_base"
        else
            local found=""
            local candidates=(
                "${target_dir}/${READABLE_ROOT}/${BASE_REL}.smali"
                "${target_dir}/AirCommand_reablable/smali/${BASE_REL}.smali"
                "./AirCommand_reablable/smali/${BASE_REL}.smali"
                "/home/workdir/artifacts/legacy_smali/AirCommand_reablable/smali/${BASE_REL}.smali"
            )
            for c in "${candidates[@]}"; do
                if [[ -f "$c" ]]; then
                    found="$c"
                    break
                fi
            done

            if [[ -n "$found" ]]; then
                echo "==> Injecting BleSpenDriver from: $found"
                mkdir -p "$(dirname "$dst_base")"
                cp -v "$found" "$dst_base"
            else
                echo "==> WARNING: BleSpenDriver.smali not found."
                echo "    VerifyError may still occur if the base class is absent."
            fi
        fi
        echo
    fi

    # ------------------------------------------------------------------
    # 1. Rewrite every BleSpen*Driver.smali
    # ------------------------------------------------------------------
    local count=0
    local tmp_list
    tmp_list=$(mktemp)

    for root in \
        "${target_dir}/${LEGACY_ROOT}" \
        "${target_dir}/${READABLE_ROOT}" \
        "${target_dir}/${TARGET_SMALI_ROOT}" \
        "${target_dir}/${MODERN_ROOT}"
    do
        [[ -d "$root" ]] || continue
        find "$root" -type f -name 'BleSpen*Driver.smali' >> "$tmp_list" 2>/dev/null || true
    done

    while IFS= read -r f; do
        [[ -z "$f" ]] && continue
        [[ "$f" == *"/BleSpenDriver.smali" ]] && continue   # never touch the base
        rewrite_one_driver "$f"
        count=$((count + 1))
    done < "$tmp_list"
    rm -f "$tmp_list"

    echo
    echo "==> Finished. Rewrote $count driver file(s)."
    echo
    echo "Next:"
    echo "  • Merge fixed drivers into AirCommand_7.6.34.7/smali if needed"
    echo "  • Run rewrite_legacy_factories.sh for the matching factories"
    echo "  • Let patch.sh apply the version-specific R8 mapping"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    rewrite_legacy_drivers "${1:-.}" "${2:-yes}"
else
    echo "Sourced → rewrite_legacy_drivers() is ready"
fi
