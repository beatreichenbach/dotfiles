#!/bin/sh

set -eu

repo="$(cd "$(dirname "$0")/.." && pwd)"
user="$repo/user"

# Config
cd "$user" && stow -t ~ .

# Steam
ln -sf /home/shared/steam/common ~/.steam/steam/steamapps/common
