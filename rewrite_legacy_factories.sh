#!/bin/bash
# =============================================================================
# rewrite_legacy_factories.sh
#
# Structural rewrite of legacy BleSpen*Factory smali so they are compatible
# with a modern (R8-optimised) AirCommand tree.
#
# Modern tree for this project:  AirCommand_7.6.34.7
# Legacy / readable source:      AirCommand_reablable  or  legacy_factories
#
# What this script does (version-agnostic, NO mapping-dependent renames):
#   1. Strips CRLF
#   2. Ensures .super is BleSpenDeviceFactory (structural)
#   3. Leaves ALL method names and type descriptors exactly as they are
#      in the legacy/readable source.
#
# Why no renames?
#   Each major AirCommand version has a different R8 map.
#   Short names (a / b / d) and obfuscated types (Lc3/b, Lc3/c, …)
#   are applied later by patch.sh.  Hard-coding one version’s map here
#   would break the next major release.
#
# Usage:
#   ./rewrite_legacy_factories.sh [target_dir]
#   source rewrite_legacy_factories.sh && rewrite_legacy_factories [dir]
# =============================================================================

set -euo pipefail

LEGACY_ROOT="${LEGACY_ROOT:-legacy_factories/smali}"
READABLE_ROOT="${READABLE_ROOT:-AirCommand_reablable/smali}"
TARGET_SMALI_ROOT="${TARGET_SMALI_ROOT:-smali}"
MODERN_ROOT="${MODERN_ROOT:-AirCommand_7.6.34.7/smali}"

DEVICE_FACTORY="com/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDeviceFactory"

# ---------------------------------------------------------------------------
rewrite_one_factory() {
    local file="$1"

    # Normalise line endings
    sed -i 's/\r$//' "$file" 2>/dev/null || true

    echo "  [FIX ] $(basename "$(dirname "$file")")/$(basename "$file")"

    # ------------------------------------------------------------------
    # Structural only: make sure the factory extends BleSpenDeviceFactory.
    # Do NOT touch method names or type descriptors – that is patch.sh’s job.
    # ------------------------------------------------------------------
    local current_super
    current_super=$(grep -m1 '^\.super ' "$file" 2>/dev/null | tr -d '\r' | sed -E 's/^\.super L//;s/;$//' || true)

    if [[ -n "$current_super" && "$current_super" != "$DEVICE_FACTORY" ]]; then
        # Only rewrite if it looks like it should be a device factory
        if [[ "$current_super" == *"BleSpen"*Factory* || "$current_super" == *"DeviceFactory"* || -z "$current_super" ]]; then
            sed -i "s|^\.super L.*|.super L${DEVICE_FACTORY};|" "$file"
            echo "         .super → ${DEVICE_FACTORY}"
        fi
    fi

    # Tidy .source
    local simple
    simple=$(basename "$file" .smali)
    sed -i "s|^\.source \".*\"|.source \"${simple}.java\"|" "$file"
}

# ---------------------------------------------------------------------------
rewrite_legacy_factories() {
    local target_dir="${1:-.}"

    echo "============================================================"
    echo " rewrite_legacy_factories"
    echo " target_dir  = $target_dir"
    echo " LEGACY_ROOT = $LEGACY_ROOT"
    echo " TARGET_ROOT = $TARGET_SMALI_ROOT"
    echo " MODERN_ROOT = $MODERN_ROOT"
    echo "============================================================"
    echo
    echo "NOTE: Method names and type descriptors are left UNCHANGED."
    echo "      R8 mapping is applied later by patch.sh for each major version."
    echo

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
        find "$root" -type f -name 'BleSpen*Factory.smali' >> "$tmp_list" 2>/dev/null || true
    done

    while IFS= read -r f; do
        [[ -z "$f" ]] && continue
        # never touch the abstract base
        [[ "$f" == *"/BleSpenDeviceFactory.smali" ]] && continue
        rewrite_one_factory "$f"
        count=$((count + 1))
    done < "$tmp_list"
    rm -f "$tmp_list"

    echo
    echo "==> Finished. Processed $count factory file(s)."
    echo
    echo "What was done:"
    echo "  • CRLF stripped"
    echo "  • .super forced to BleSpenDeviceFactory where appropriate"
    echo "  • Method names / types left exactly as in the legacy source"
    echo
    echo "Next:"
    echo "  • Merge fixed factories into AirCommand_7.6.34.7/smali if needed"
    echo "  • Run rewrite_legacy_drivers.sh on the matching *Driver.smali files"
    echo "  • Let patch.sh apply the version-specific R8 mapping"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    rewrite_legacy_factories "${1:-.}"
else
    echo "Sourced → rewrite_legacy_factories() is ready"
fi
