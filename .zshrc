# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="robbyrussell"

plugins=(git npm yarn node docker docker-compose command-not-found you-should-use zsh-syntax-highlighting tmux rust golang autojump)

source $ZSH/oh-my-zsh.sh

export BAT_THEME="Catppuccin-mocha"

# Catppuccin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias ls="exa"
alias cat="bat"
alias icat="kitty +kitten icat"

DISABLE_AUTO_TITLE=true

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

function set_win_title(){
    echo -ne "\033]0; Terminal \007"
}

precmd_functions+=(set_win_title)

autoload -Uz compinit && compinit

#fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#kubectl
source <(kubectl completion zsh)

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/leiswatch/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Go path
export GOPATH="$HOME/.go"
