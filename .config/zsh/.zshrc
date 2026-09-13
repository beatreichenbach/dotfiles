# --- antidote ---

source "$ZDOTDIR/.antidote/antidote.zsh"
antidote load

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# --- env ---

HISTFILE="${XDG_STATE_HOME}/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
unsetopt nomatch

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
bindkey "\e[2;6~" paste # ctrl + shift + v
bindkey '\e.' insert-last-word # alt + .

# --- alias ---

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ll="ls -lahv --group-directories-first --time-style=long-iso"
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings"'
alias qmv="qmv -f destination-only"

# --- exec ---

[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

# bun completions
[ -s "/home/beat/.bun/_bun" ] && source "/home/beat/.bun/_bun"
