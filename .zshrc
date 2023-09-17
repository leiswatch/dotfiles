# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git npm yarn node docker docker-compose command-not-found you-should-use zsh-syntax-highlighting tmux rust golang autojump)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}

source $ZSH/oh-my-zsh.sh

export BAT_THEME="Catppuccin-mocha"

# Catppuccin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Rose Pine
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#21202e,spinner:#ebbcba,hl:#eb6f92 \
# --color=fg:#e0def4,header:#eb6f92,info:#c4a7e7,pointer:#ebbcba \
# --color=marker:#ebbcba,fg+:#9ccfd8,prompt:#c4a7e7,hl+:#eb6f92"

alias ls="exa"
alias cat="batcat"

DISABLE_AUTO_TITLE=true

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
# eval "$(fnm env --use-on-cd --shell zsh --version-file-strategy recursive)"

# Go path
export GOPATH="$HOME/.go"

# fzf
source /usr/share/doc/fzf/examples//key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# kubectl
source <(kubectl completion zsh)

# starship
eval "$(starship init zsh)"

# bun completions
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
