ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZSH_CACHE_DIR/completions ] && mkdir -p "$(dirname $ZSH_CACHE_DIR/completions)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

ZOXIDE_CMD_OVERRIDE="cd"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use

zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::fnm
zinit snippet OMZP::git
zinit snippet OMZP::golang
zinit snippet OMZP::kubectl
zinit snippet OMZP::node
zinit snippet OMZP::npm
zinit snippet OMZP::rust
zinit snippet OMZP::starship
zinit snippet OMZP::yarn
zinit snippet OMZP::zoxide

zinit snippet OMZL::directories.zsh
zinit snippet OMZL::git.zsh

if [ ! -f "$ZSH_CACHE_DIR/completions/_deno" ]; then
    deno completions zsh >"$ZSH_CACHE_DIR/completions/_deno"
fi

fpath=("$ZSH_CACHE_DIR/completions" $fpath)

autoload -Uz compinit && compinit

zinit cdreplay -q

# Options
# setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY 
setopt SHARE_HISTORY 
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt PROMPT_SUBST

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$XDG_CACHE_HOME/zsh_history"

# Styles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#3b4261,spinner:#2ac3de,hl:#f7768e,fg:#c0caf5,header:#f7768e,info:#cba6f7,pointer:#2ac3de,marker:#2ac3de,fg+:#c0caf5,prompt:#cba6f7,hl+:#f7768e,separator:#3b4261,scrollbar:#2ac3de,border:#3b4261,label:#c0caf5 --prompt='  ' --info=right -i --reverse --padding 0,1
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always -x $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always -x $realpath'

# Bindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^W' forward-word
bindkey '^B' backward-word
bindkey '^J' forward-char
bindkey '^K' backward-char
bindkey '^ ' fzf-completion
bindkey '^Y' accept-line
bindkey 'Tab' fzf-completion
bindkey '^L' clear-screen
bindkey '^R' fzf-history-widget
bindkey '^T' fzf-file-widget
bindkey '^H' backward-kill-word
bindkey '^G' kill-word
bindkey '^O' kill-line
# bindkey '^L' kill-word
# bindkey '^<' backward-delete-char
# bindkey '^>' delete-char

# Aliases
alias ls='eza'
alias cat='bat'
alias tksv='tmux kill-server'
# alias tmux='tmux a || tmux'
alias gcwtc='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'
alias gcwip='git commit -m "WIP: $(date)"'
alias fsb='git switch $(git branch | grep -v \"^\*\" | fzf --height=30% --reverse --info=inline)'
alias rmr='rm -r'
alias v='nvim'

# Functions
function vmrss() {
    if [ -n "$1" ]; then
        while true; do
            sync
            cat /proc/"$1"/status | grep --color=auto "VmRSS" | grep --color=auto -o '[0-9]\+' | awk '{print $1/1024 " MB"}'
            sleep 1
        done
    fi
}

# bun
[ -s "$XDG_DATA_HOME/.bun/_bun" ] && source "$XDG_DATA_HOME/.bun/_bun"

# fnm
eval "$(fnm env --shell zsh --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines --log-level error)"

# fzf
source <(fzf --zsh)
