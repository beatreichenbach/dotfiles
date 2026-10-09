# Dotfiles

## Installation

### System

```shell
sudo ./scripts/install-system.sh
```

### User

```shell
./scripts/install-user.sh
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

Preferences are tracked in [`dconf.ini`](dconf.ini) and applied with:

```shell
dconf dump / > dump.ini
dconf reset -f /
dconf load / < dconf.ini
```

### xdg

As many files as possible have been moved to the `~/.config` folder with the help of 
[xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja).

<https://wiki.archlinux.org/title/XDG_Base_Directory>

### Steam

Use the following wrapper for most games:
```gamescope -W 1920 -H 1080 --fullscreen --force-grab-cursor -- %command%```

Disable pre-compilation of shaders in Steam settings.

Steam is very picky about ownership:
Everything under `steamapps/common` must be owned by the user currently running Steam.

## Packages

### gnome-keyring

Auto unlock only targets a keyring named `login` whose password equals the account password.
On a fresh setup remove the old default keyring so PAM creates it:

```shell
rm -f ~/.local/share/keyrings/{Default_keyring.keyring,default,user.keystore}
```

### multiplexer
https://zellij.dev/

### sad
https://github.com/ms-jpq/sad
