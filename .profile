# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

export PNPM_HOME="$HOME/.local/share/pnpm"
export GOPATH="$HOME/.go"
export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"
export PATH="$DENO_INSTALL/bin:$PNPM_HOME:$BUN_INSTALL/bin:$PATH"

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

if [ -d "/usr/local/go/bin" ] ; then
  PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "$HOME/.local/share/fnm" ] ; then
  PATH="$HOME/.local/share/fnm:$PATH"
fi
