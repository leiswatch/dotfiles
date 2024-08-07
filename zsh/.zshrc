# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=robbyrussell
DISABLE_AUTO_TITLE="true"

plugins=(
    archlinux
    command-not-found
    docker
    docker-compose
    fzf-tab
    git
    golang
    kubectl
    node
    npm
    rust
    tmux
    yarn
    you-should-use
    zsh-syntax-highlighting
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt promptsubst

zstyle ':completion:*' menu no

# Aliases
alias ls='eza'
alias cat='bat'
# alias tksv='tmux kill-server'
alias gcwtc='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'
alias fsb='git switch $(git branch | grep -v \"^\*\" | fzf --height=30% --reverse --info=inline)'

function vmrss() {
    if [ -n "$1" ]; then
        while true; do
            sync
            cat /proc/"$1"/status | grep --color=auto "VmRSS" | grep --color=auto -o '[0-9]\+' | awk '{print $1/1024 " MB"}'
            sleep 1
        done
    fi
}

# function precmd() {
#     print -Pn "\e]0;Terminal\a"
# }

# kubectl
eval "$(kubectl completion zsh)"

# fzf
source <(fzf --zsh)

# bun
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# fnm
eval "$(fnm env --shell zsh)"

# starship
eval "$(starship init zsh)"

# zoxide
# eval "$(zoxide init zsh)"

# atuin
# eval "$(atuin init zsh)"

# eval "$(oh-my-posh init zsh)"
# eval "$(oh-my-posh init zsh --config /home/leiswatch/.cache/oh-my-posh/themes/spaceship.omp.json)"

# zprof
