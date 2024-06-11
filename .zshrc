# zmodload zsh/zprof

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

ZINIT_COMPLETIONS="$ZSH_CACHE_DIR/completions"
[ ! -d $ZINIT_COMPLETIONS ] && mkdir -p "$(dirname $ZINIT_COMPLETIONS)"

# Plugins
zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait"1" lucid
zinit light zsh-users/zsh-completions
zinit ice wait"1" lucid
zinit light MichaelAquilina/zsh-you-should-use
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab

# Snippets
zinit ice wait"1" lucid
zinit snippet OMZP::dnf
zinit ice wait"1" lucid
zinit snippet OMZP::docker
zinit ice wait"1" lucid
zinit snippet OMZP::docker-compose
zinit ice wait"1" lucid
zinit snippet OMZP::fnm
zinit ice wait"1" lucid
zinit snippet OMZP::git
zinit ice wait"1" lucid
zinit snippet OMZP::golang
zinit ice wait"1" lucid
zinit snippet OMZP::kubectl
zinit ice wait"1" lucid
zinit snippet OMZP::node
zinit ice wait"1" lucid
zinit snippet OMZP::rust
zinit ice wait"1" lucid
zinit snippet OMZP::yarn

(( ${fpath[(Ie)"$ZINIT_COMPLETIONS"]} )) || fpath=("$ZINIT_COMPLETIONS" $fpath)

# Load completions
autoload -Uz compinit
compinit

zinit cdreplay -q

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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no


# Aliases
alias ls="eza"
alias cat="bat"
alias cd="z"
alias tksv='tmux kill-server'

function gcwtc() {
    git commit -m "$(curl -s https://whatthecommit.com/index.txt)"
}

function fsb() {
    git switch $(git branch | grep -v \"^\*\" | fzf --height=30% --reverse --info=inline)
}

function vmrss() {
	if [ -n "$1" ]; then
		while true; do
			sync
			cat /proc/"$1"/status | grep --color=auto "VmRSS" | grep --color=auto -o '[0-9]\+' | awk '{print $1/1024 " MB"}'
			sleep 1
		done
	fi
}

function set_win_title(){
    echo -ne "\033]0; Kitty \007"
}

precmd_functions+=(set_win_title)

# kubectl
eval "$(kubectl completion zsh)"

# fzf
eval "$(fzf --zsh)"

# bun
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# fnm
eval "$(fnm env --shell zsh)"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# zprof
