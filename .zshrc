# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=robbyrussell

plugins=(git npm yarn node docker docker-compose command-not-found you-should-use zsh-syntax-highlighting tmux rust golang ubuntu)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

export BAT_THEME="Catppuccin-mocha"
export BAT_STYLE="numbers,header,changes"

# Catppuccin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias ls="eza"
alias cat="bat"

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

precmd () {print -Pn "\e]0;Terminal\a"}

DISABLE_AUTO_TITLE="true"
FNM_COREPACK_ENABLED="true"

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


autoload -Uz compinit && compinit

# fzf
source /usr/share/fzf/shell/key-bindings.zsh
source $HOME/.fzf/completion.zsh

# kubectl
source <(kubectl completion zsh)

# bun completions
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# fnm
eval "$(fnm env --shell zsh)"

# starship
eval "$(starship init zsh)"
