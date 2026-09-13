# Dotfiles

## Installation

### don't

The installation files have not been tested, don't use them.

### stow

Use stow to install the config files.

```shell
stow --adopt .
git reset --hard
stow -t ~ .
```







## Configuration

### google-chrome-stable

Set following flags in [chrome](chrome://flags):
```
WebRTC PipeWire support:  Emabled
Preferred Ozone platform: Wayland
```

### Fonts

Current font used: [JetBrains Mono](https://www.jetbrains.com/lp/mono)

Fonts are installed here: `/usr/share/fonts`
Font defaults: `~/.config/fontconfig/fonts.conf`
Console defaults: `/etc/vconsole.conf`

### GTK

GTK is actually customized in `sway/config-theme`.

The current GTK conf can be stored and restored with:
```shell
dconf dump / > dump.dconf
dconf reset -f /
dconf load / < dump.dconf
```

Current theme used: `Qogir` which is available in the AUR:
`qogir-gtk-theme qogir-icon-theme`

However since I want custom options for the qogir theme:
```shell
git clone https://github.com/vinceliuice/Qogir-theme
./install.sh --theme default --color standard --icon arch
```

### xdg

As many files as possible have been moved to the `~/.config` folder with the help of 
[xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja).

Most of the configuration for xdg happens in the `.profile` file.

https://wiki.archlinux.org/title/XDG_Base_Directory

### xdg-desktop-portal

https://man.archlinux.org/man/xdg-desktop-portal-wlr.5


### Houdini

Houdini requires qt5 to run.

### Steam

Use the following wrapper for most games:
```gamescope -W 1920 -H 1080 --fullscreen --force-grab-cursor -- %command%```


## Additional Tools

### multiplexer
https://zellij.dev/

### sad
https://github.com/ms-jpq/sad


## Steam
# Settings
Disable pre-combile shader...

## Shared library
sudo groupadd steam
sudo mkdir -p /home/shared/steam

sudo usermod -aG steam beat
sudo usermod -aG steam claire

sudo chmod -R 2775 /home/shared/steam
sudo chown -R root:steam /home/shared/steam

ln -sf /home/shared/steam/common /home/beat/.steam/steam/steamapps/common
ln -sf /home/shared/steam/common /home/claire/.steam/steam/steamapps/common

## Packages
ripgrep
fd-find
renameutils
llama-cpp
zoxide
fzf
mpv

# Hyprland

sudo dnf install hyprland hypridle
systemctl --user enable --now hypridle.service