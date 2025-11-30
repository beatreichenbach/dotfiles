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

### paru

[github.com/Morganamilo/paru](https://github.com/Morganamilo/paru#installation)

```shell
pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd .. && rm -rf paru
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

### sway

- [autotiling](https://github.com/nwg-piotr/autotiling)
- 

Notifications (not used):
- https://github.com/dharmx/vile
- https://github.com/lucalabs-de/end

### tuigreet

Sessions are [loaded](https://github.com/apognu/tuigreet#sessions) from the following locations:
```
/usr/share/xsessions
/usr/share/wayland-sessions
```

### Wallpapers

- To cycle through wallpapers: [wpaperd](https://github.com/danyspin97/wpaperd)
- To display wallpapers: [swaybg](https://github.com/swaywm/swaybg)
- For nicer wallpapers (not used): [swww](https://github.com/Horus645/swww)

### Workspaces

Workspaces are currently set up like this:
- `super + 1`: fun
- `super + 2`: work
- `super + 3`: work browser
- `super + 4`: work terminal
- `super + 5`: slack
- `super + 6`:
- `super + 7`:
- `super + 8`:
- `super + 9`: utilities

### xdg

As many files as possible have been moved to the `~/.config` folder with the help of 
[xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja).

Most of the configuration for xdg happens in the `.profile` file.

https://wiki.archlinux.org/title/XDG_Base_Directory

### xdg-desktop-portal

https://man.archlinux.org/man/xdg-desktop-portal-wlr.5

### JetBrains Products

PyCharm settings are stored with
[Settings Sync](https://www.jetbrains.com/help/pycharm/sharing-your-ide-settings.html#IDE_settings_sync)

## Additional Information

### multiplexer
https://zellij.dev/

https://www.youtube.com/watch?v=DzNmUNvnB04

### sway
https://github.com/WillPower3309/swayfx

### pulsemixer
https://github.com/GeorgeFilipkin/pulsemixer

### abduco
https://wiki.archlinux.org/title/Abduco

### sshfs
https://wiki.archlinux.org/title/SSHFS

### ripgrep
https://github.com/BurntSushi/ripgrep

https://github.com/walderf/dotfiles/blob/main/.config/ripgrep/rg.conf

### fuzzy-finder
https://github.com/junegunn/fzf

### zoxide
https://github.com/ajeetdsouza/zoxide

### bat
https://github.com/sharkdp/bat

### sad
https://github.com/ms-jpq/sad
