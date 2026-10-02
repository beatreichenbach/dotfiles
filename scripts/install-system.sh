#!/bin/sh

set -eu

repo="$(cd "$(dirname "$0")/.." && pwd)"

# System
cp -rf "$repo"/system/. /

# Steam
sudo mkdir -p /home/shared/steam
chown root:root /etc/sudoers.d/steam-library
chmod 0440 /etc/sudoers.d/steam-library
visudo -cf /etc/sudoers.d/steam-library

echo "Installed system files."
