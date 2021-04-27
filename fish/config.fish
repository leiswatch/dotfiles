set fish_greeting
set -x BAT_THEME base16
set -x DENO_INSTALL /home/leiswatch/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
load_nvm

starship init fish | source
