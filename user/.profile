#!/bin/sh

# Bun
[ -d "$HOME/.bun/bin" ] && export PATH="$HOME/.bun/bin:$PATH"

# OpenCode
[ -d "$HOME/.opencode/bin" ] && export PATH="$HOME/.opencode/bin:$PATH"

# Secrets
[ -f "$HOME/.secret" ] && . "$HOME/.secret"
