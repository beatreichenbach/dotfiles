# Dotfiles

## Installation

### System

Install system files:

```shell
sudo ./scripts/install-system.sh
```

### User

Install user configuration:

```shell
./scripts/install-user.sh
```

Sudoers entry for admin:

```shell
echo -e "${USER}\tALL=(ALL:ALL) ALL" > "/etc/sudoers.d/$USER"
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

The current GTK conf can be stored and restored with:
```shell
dconf dump / > dump.dconf
dconf reset -f /
dconf load / < dump.dconf
```

### xdg

As many files as possible have been moved to the `~/.config` folder with the help of 
[xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja).

https://wiki.archlinux.org/title/XDG_Base_Directory

### xdg-desktop-portal

https://man.archlinux.org/man/xdg-desktop-portal-wlr.5

### Houdini

Houdini requires qt5 to run.
SELinux contexts/policies for the license server are set up by `scripts/install-houdini.sh`.

### Steam

Use the following wrapper for most games:
```gamescope -W 1920 -H 1080 --fullscreen --force-grab-cursor -- %command%```

Disable pre-compilation of shaders in Steam settings.

#### Shared library

Steam is very picky about ownership: everything under `steamapps/common` must be
owned by the user currently running Steam. `steam-library` fixes this on login.
`~/.config/systemd/user/steam-library.service` runs `steam-library` in the background
after the graphical session starts, so it never blocks login.

Create a shared steam library and enable the service:

```shell
sudo mkdir -p /home/shared/steam
systemctl --user enable --now steam-library.service
```

## Additional Tools

### multiplexer
https://zellij.dev/

### sad
https://github.com/ms-jpq/sad


## Packages
ripgrep
fd-find
renameutils
llama-cpp
zoxide
fzf
mpv

## Hyprland

sudo dnf install hyprland hypridle
systemctl --user enable --now hypridle.service

## Keyring & SSH agent

gnome-keyring provides the Secret Service (`org.freedesktop.secrets`) and is
unlocked automatically at login via PAM. SSH uses a plain OpenSSH agent.

### Install / enable

```shell
# Secret Service + PAM auto-unlock (provides pam_gnome_keyring.so)
sudo dnf install gnome-keyring-pam

# user units (no sudo)
systemctl --user enable --now gnome-keyring-daemon.socket gnome-keyring-daemon.service
systemctl --user enable --now ssh-agent.socket
```

`/etc/pam.d/greetd` already ships the `pam_gnome_keyring.so` lines with the
Fedora `greetd` package; installing `gnome-keyring-pam` activates them. Auto
unlock only targets a keyring named `login` whose password equals the account
password. On a fresh setup remove the old default keyring so PAM creates it:

```shell
rm -f ~/.local/share/keyrings/{Default_keyring.keyring,default,user.keystore}
```

### Optional

Keep keyring secrets out of swap:

```shell
sudo setcap cap_ipc_lock=+ep /usr/bin/gnome-keyring-daemon
```

Remove the GUI keyring manager (not required):

```shell
sudo dnf remove seahorse
```
