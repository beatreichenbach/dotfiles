# --- antidote ---

source "/usr/share/zsh-antidote/antidote.zsh"
antidote load

# zsh_autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

# --- ssh ---

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# --- keyboard ---

bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[3~" delete-char # del
bindkey "^[[1;5C" forward-word # ctrl + right
bindkey "^[[1;5D" backward-word # ctrl + left
bindkey "^V" paste # ctrl + v

# --- alias ---

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ll="ls -lahv --group-directories-first --time-style=long-iso"
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings"'

# --- exec ---

eval "$(starship init zsh)"
