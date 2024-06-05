# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=robbyrussell

plugins=(
	command-not-found
	docker
	docker-compose
	fzf-tab
	git
	golang
	node
	npm
	rust
	tmux
	ubuntu
	yarn
	you-should-use
	zsh-syntax-highlighting
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# Load completions
autoload -Uz compinit && compinit

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

alias ls="eza"
alias cat="bat --map-syntax='*.astro:HTML'"
alias fsb="git branch | grep -v \"^\*\" | fzf --height=30% --reverse --info=inline | xargs git switch"

function vmrss() {
	if [ -n "$1" ]; then
		while true; do
			sync
			cat /proc/"$1"/status | grep --color=auto "VmRSS" | grep --color=auto -o '[0-9]\+' | awk '{print $1/1024 " MB"}'
			sleep 1
		done
	fi
}

precmd() {
	print -Pn "\e]0;Kitty\a"
}

# kubectl
source <(kubectl completion zsh)

#fzf
eval "$(fzf --zsh)"

# bun completions
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# fnm
eval "$(fnm env --shell zsh)"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"
