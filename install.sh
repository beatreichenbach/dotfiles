#!/bin/bash

# paru
pushd ..
pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
popd

# packages
while IFS= read -r line; do
  if [[ $line != "#"* ]]; then
    paru -S "$line"
  fi
done < packages.txt

# system
cp -rf system/* /

# sudo
echo -e "${USER}\tALL=(ALL:ALL) ALL" > "/etc/sudoers.d/$USER"

# GTK Theme: Qogir
git clone https://github.com/vinceliuice/Qogir-theme
./install.sh --theme default --color standard --icon arch
rm -rf "Qogir-theme"

# configuration
stow -t ~ .