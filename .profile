#!/bin/bash

# Initialize xdg, see:
# https://github.com/b3nj5m1n/xdg-ninja

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export KERAS_HOME="$XDG_STATE_HOME/keras"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export TRITON_HOME="$XDG_CACHE_HOME/triton"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ZDOTDIR="$HOME/.config/zsh"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _Z_DATA="$XDG_DATA_HOME/z"

export SHELL="/usr/bin/zsh"
export TERM="xterm-256color"
export EDITOR="vim"

# Nuke
export NUKE_PATH="$XDG_CONFIG_HOME/nuke"
export NUKE_CRASH_HANDLING=0
export NUKE_TEMP_DIR="/tmp/nuke"
export FN_CRASH_DUMP_PATH="/tmp/nuke"

# Houdini Wayland support
export QT_XCB_NO_XI2=1

# Bun
if [ -d "$HOME/.bun" ]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

# OpenCode
export PATH=$HOME/.opencode/bin:$PATH

[ -f "$HOME/.secret" ] && source "$HOME/.secret"
