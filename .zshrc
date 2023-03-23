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
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Rose pine
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
#  --color=fg:#e0def4,hl:#6e6a86
#  --color=fg+:#e0def4,bg+:#191724,hl+:#eb6f92
#  --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
#  --color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"

alias ls="exa"
alias cat="bat"

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
