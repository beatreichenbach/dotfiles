---
name: system-environment
description: Describes this machine's operating system, desktop stack, hardware, and toolchain so another assistant or tool has accurate context. Use when asked about the user's environment, distro, desktop, versions, hardware, or when porting/generating config or setup instructions that must match this system.
---

# System environment

Tool-agnostic summary of the machine. Contains no usernames, hostnames, paths,
or other identifiers, so it can be pasted into other assistants (e.g. Gemini)
as-is.

## Operating system

- Fedora Linux 44, x86_64
- Kernel 7.2.x (Fedora build)
- SELinux enforcing; firewalld
- Package manager: `dnf` (RPM). Some desktop packages come from a COPR repo.
- No Nix
- Disks: ext4, **no full-disk encryption (no LUKS)**; zram swap

## Desktop / session

- Wayland session
- Hyprland 0.56.x, configured in **Lua**
- UWSM 0.27.x (systemd-managed session) started from greetd
- greetd 0.10.x with tuigreet 0.9.x as the greeter
- noctalia 5.x (shell/bar/notifications)
- hyprpolkitagent 0.2.x (polkit authentication agent)
- xdg-desktop-portal-hyprland 1.4.x
- PipeWire 1.6.x + WirePlumber 0.5.x
- gnome-keyring 50.x (Secret Service, unlocked via PAM) + systemd `ssh-agent.socket`

## Shell

- zsh 5.9, `ZDOTDIR` set to `~/.config/zsh`
- antidote (plugin manager), starship, zoxide, fzf
- alacritty 0.17 terminal
- Machine-wide env in `/etc/profile.d`, user overrides in `~/.profile`
- User config tracked with GNU stow + XDG base directories

## Hardware

- CPU: AMD Ryzen 7 7800X3D (8 cores / 16 threads)
- GPU: NVIDIA GeForce RTX 5080 (GB203), NVIDIA open kernel module 615.x
- Secondary GPU: AMD Raphael integrated graphics
- RAM: 64 GB
- Storage: NVMe SSD, ext4

## Toolchain

- Python 3.14
- Node.js 22
- Git 2.55
- OpenSSH 10.2

## Notes / conventions

- Prefer `dnf`; Hyprland and related desktop packages may come from COPR.
- No Nix.
- No disk encryption: environment secrets rely on file permissions and the
  keyring only (see the keyring behavior above).
- Session/environment flow: greetd -> uwsm -> Hyprland, with `/etc/profile.d`
  loaded before `~/.profile`, and uwsm env files applied system -> user.
