starship init fish | source

alias vim "nvim"
alias ls "exa"
alias cat "batcat"

set -Ux DENO_INSTALL "$HOME/.deno"
set -Ux BAT_THEME "1337"
set -Ux PNPM_HOME "$HOME/.local/share/pnpm"
set -Ux FZF_DEFAULT_OPTS "--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
set -Ux fish_greeting ""

set PATH $PATH /usr/local/go/bin
set PATH $PATH $DENO_INSTALL/bin

load_nvm > /dev/stderr

