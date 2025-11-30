#!/bin/bash

# initialize xdg, see:
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
export HISTFILE="${XDG_STATE_HOME}/bash/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ZDOTDIR="$HOME/.config/zsh"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _Z_DATA="$XDG_DATA_HOME/z"

export NUKE_PATH="$XDG_CONFIG_HOME/nuke"
export NUKE_TEMP_DIR="/tmp/nuke"
export FN_CRASH_DUMP_PATH="/tmp/nuke"
export NUKE_CRASH_HANDLING=0

export SHELL="zsh"
export TERMINAL="ghostty"
export TERM="xterm-256color"
export EDITOR="vim"

[ -f "$HOME/.secret" ] && source "$HOME/.secret"

