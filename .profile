# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

if [ -d "$HOME/.go/bin" ] ; then
  PATH="$HOME/.go/bin:$PATH"
fi

if [ -d "$HOME/.local/share/pnpm" ] ; then
  PATH="$HOME/.local/share/pnpm:$PATH"
fi

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/go/bin
# Deno
export DENO_INSTALL=$HOME/.deno
export PATH=$PATH:$DENO_INSTALL/bin
# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Other
export GTK_THEME=Mint-Y-Dark-Aqua
export XCURSOR_THEME=Simpe1-Adw-Dark
export QT_QPA_PLATFORMTHEME=qt5ct

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_LOCAL_HOME="$HOME/.local"

export TERM=kitty
