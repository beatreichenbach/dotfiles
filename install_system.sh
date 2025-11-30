#!/bin/bash

# system
cp -rf system/* /

# sway
cp -f ".config/sway/startsway" "/usr/local/bin/"

# sudo
echo -e "${USER}\tALL=(ALL:ALL) ALL" > "/etc/sudoers.d/$USER"

packages=(
"greetd"
"greetd-tuigreet"

"alsa-plugins"
"alsa-utils"
"pulseaudio"
"pulseaudio-alsa"

"wayland"
"sway"

"tree"
"ranger"
"less"
"bat"
"btop"
"grim"
"wl-clipboard"
)

pacman -S "${packages[@]}"
