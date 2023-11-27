# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=robbyrussell

plugins=(git npm yarn node docker docker-compose command-not-found you-should-use zsh-syntax-highlighting tmux rust golang autojump)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}

source $ZSH/oh-my-zsh.sh

export BAT_THEME="Catppuccin-mocha"

# Catppuccin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias ls="eza"
alias cat="bat"
alias ytdl="youtube-dl"

function vmrss() {
    if [ -n "$1" ]
    then
        while true
        do
            sync
            cat /proc/"$1"/status | grep --color=auto "VmRSS" | grep --color=auto -o '[0-9]\+' | awk '{print $1/1024 " MB"}'
            sleep 1
        done
    fi
}

DISABLE_AUTO_TITLE=true
FNM_COREPACK_ENABLED=true

function set_win_title(){
    echo -ne "\033]0; Terminal \007"
}

precmd_functions+=(set_win_title)

autoload -Uz compinit && compinit

# pnpm
export PNPM_HOME="/home/leiswatch/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
export PATH="/home/leiswatch/.local/share/fnm:$PATH"
eval "$(fnm env --shell zsh)"

# Go path
export GOPATH="$HOME/.go"

# fzf
source $HOME/.fzf/key-bindings.zsh
source $HOME/.fzf/completion.zsh

# kubectl
source <(kubectl completion zsh)

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# starship
eval "$(starship init zsh)"
