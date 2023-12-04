#!/bin/bash

# GTK Theme: Qogir
git clone https://github.com/vinceliuice/Qogir-theme
./install.sh --theme default --color standard --icon arch
rm -rf "Qogir-theme"

# packages
packages=(
  "ttf-jetbrains-mono-nerd"
  "alacritty"
  "starship"
  "zsh"
  "zsh-antidote"
  "tofi"
  "eww"
)
pacman -S "${packages[@]}"

# configuration
stow -t ~ .