#!/bin/sh

set -eu

repo="$(cd "$(dirname "$0")/.." && pwd)"
user="$repo/user"

# Config
cd "$user" && stow -t ~ .

# Services
systemctl --user enable --now hypridle.service
systemctl --user enable --now gnome-keyring-daemon.socket gnome-keyring-daemon.service
systemctl --user enable --now ssh-agent.socket

# Steam
steamapps="$HOME/.steam/steam/steamapps"
mkdir -p "$steamapps"
if [ -d "$steamapps/common" ] && [ ! -L "$steamapps/common" ]; then
    rmdir "$steamapps/common" 2>/dev/null || true
fi
ln -sfn /home/shared/steam/common "$steamapps/common"
systemctl --user enable --now steam-library.service
