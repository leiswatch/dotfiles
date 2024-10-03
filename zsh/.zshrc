# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=robbyrussell
DISABLE_AUTO_TITLE="true"

plugins=(
    archlinux
    asdf
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
    starship
    tmux
    yarn
    you-should-use
    zoxide
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
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#3b4261,spinner:#2ac3de,hl:#f7768e,fg:#c0caf5,header:#f7768e,info:#cba6f7,pointer:#2ac3de,marker:#2ac3de,fg+:#c0caf5,prompt:#cba6f7,hl+:#f7768e,separator:#3b4261,scrollbar:#2ac3de,border:#3b4261,label:#c0caf5 --prompt='  ' --info=right -i --reverse --padding 0,1

# Aliases
alias ls='eza'
alias cat='bat'
alias cd='z'
alias lg='lazygit'
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

# fzf
source <(fzf --zsh)

# bun
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# function precmd() {
#     print -Pn "\e]0;Terminal\a"
# }

# kubectl
# eval "$(kubectl completion zsh)"


# fnm
# eval "$(fnm env --shell zsh)"

# asdf
# . /opt/asdf-vm/asdf.sh

# starship
# eval "$(starship init zsh)"

# zoxide
# eval "$(zoxide init zsh)"

# atuin
# eval "$(atuin init zsh)"

# eval "$(oh-my-posh init zsh)"
# eval "$(oh-my-posh init zsh --config /home/leiswatch/.cache/oh-my-posh/themes/spaceship.omp.json)"

# zprof
