source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'

eval "$(starship init zsh)"
