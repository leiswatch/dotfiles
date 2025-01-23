# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZSH_CACHE_DIR/completions ] && mkdir -p "$(dirname $ZSH_CACHE_DIR/completions)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

ZOXIDE_CMD_OVERRIDE="cd"

# zinit ice depth=1
# zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use

zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::fzf
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

autoload -Uz compinit && compinit

zinit cdreplay -q

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

export FZF_DEFAULT_OPTS=" \
--color=bg+:#3b4261,spinner:#2ac3de,hl:#f7768e \
--color=fg:#c0caf5,header:#f7768e,info:#cba6f7,pointer:#2ac3de \
--color=marker:#2ac3de,fg+:#c0caf5,prompt:#cba6f7,hl+:#f7768e \
--color=separator:#3b4261,scrollbar:#2ac3de,border:#3b4261,label:#c0caf5 \
--prompt='  ' \
--info=right \
-i \
--reverse \
--padding 0,1"
export PNPM_HOME="$HOME/.local/share/pnpm"
export GOPATH="$HOME/.go"
export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"
export FNM_COREPACK_ENABLED=true
export ASDF_NODEJS_AUTO_ENABLE_COREPACK=true

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#3b4261,spinner:#2ac3de,hl:#f7768e,fg:#c0caf5,header:#f7768e,info:#cba6f7,pointer:#2ac3de,marker:#2ac3de,fg+:#c0caf5,prompt:#cba6f7,hl+:#f7768e,separator:#3b4261,scrollbar:#2ac3de,border:#3b4261,label:#c0caf5 --prompt='  ' --info=right -i --reverse --padding 0,1
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always -x $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always -x $realpath'

# Aliases
alias ls='eza'
alias cat='bat'
alias tksv='/usr/bin/tmux kill-server'
alias tmux='tmux a || tmux'
alias gcwtc='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'
alias gcwip='git commit -m "WIP: $(date)"'
alias fsb='git switch $(git branch | grep -v \"^\*\" | fzf --height=30% --reverse --info=inline)'

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

function set_win_title() {
    echo -ne "\033]0; Kitty \007"
}

precmd_functions+=(set_win_title)

# bun
[ -s "/home/leiswatch/.bun/_bun" ] && source "/home/leiswatch/.bun/_bun"

# fzf
# source <(fzf --zsh)

# fnm
eval "$(fnm env --shell zsh --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
