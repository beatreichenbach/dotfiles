#!/bin/sh

# Machine-wide environment defaults.

# Hardware
export WLR_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1  # Force card2 as primary GPU
export LIBVA_DRIVER_NAME=nvidia
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export NVD_BACKEND=direct

# XDG, see: https://github.com/b3nj5m1n/xdg-ninja
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# XDG defaults
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
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export TRITON_HOME="$XDG_CACHE_HOME/triton"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _Z_DATA="$XDG_DATA_HOME/z"

# General
export TERM="xterm-256color"  # Support 256 colors
export EDITOR="vim"

# Nuke
export NUKE_PATH="$XDG_CONFIG_HOME/nuke"
export NUKE_CRASH_HANDLING=0
export NUKE_TEMP_DIR="/tmp/nuke"
export FN_CRASH_DUMP_PATH="/tmp/nuke"

# Houdini
export QT_XCB_NO_XI2=1  # Wayland support
