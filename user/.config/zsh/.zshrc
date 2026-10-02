# --- antidote ---

antidote_dir="${ZDOTDIR:-$HOME}/.antidote"
if [[ ! -d "$antidote_dir" ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi
if [[ -r "$antidote_dir/antidote.zsh" ]]; then
    source "$antidote_dir/antidote.zsh"
    antidote load "${ZDOTDIR:-$HOME}/.zsh_plugins.txt"
fi

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# --- history ---

mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt nomatch

# --- keyboard ---

bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[3~" delete-char # del
bindkey "^[[1;5C" forward-word # ctrl + right
bindkey "^[[1;5D" backward-word # ctrl + left
bindkey '\e.' insert-last-word # alt + .
bindkey "\e[2;6~" paste # ctrl + shift + v

# --- alias ---

alias ll='ls -lahv --group-directories-first --time-style=long-iso'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings"'
alias qmv='qmv -f destination-only'

# --- exec ---

# NVM utilities
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# Bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"
