#!/usr/bin/env bash
set -euo pipefail

file="${HOME}/.config/noctalia/settings.toml"
value="${1:?usage: wallpaper-enabled.sh <true|false>}"

awk -v val="$value" '
    /^\[wallpaper\]$/ { in_wp = 1; print; next }
    /^\[/ { in_wp = 0 }
    in_wp && /^enabled[[:space:]]*=/ { printf "enabled = %s\n", val; found = 1; next }
    { print }
    END { if (!found) exit 1 }
' "$file" > "${file}.tmp"
mv "${file}.tmp" "$file"
