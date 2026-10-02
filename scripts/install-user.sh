#!/bin/sh

set -eu

repo="$(cd "$(dirname "$0")/.." && pwd)"
user="$repo/user"

# Config
cd "$user" && stow -t ~ .

# Steam
systemctl --user enable --now steam-library.service
