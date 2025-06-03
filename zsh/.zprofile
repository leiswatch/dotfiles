export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export BUN_INSTALL="$XDG_DATA_HOME/bun"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DENO_INSTALL="$XDG_DATA_HOME/deno"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export GOCACHE="$XDG_CACHE_HOME/go-build"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GOPATH="$XDG_DATA_HOME/go"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/rediscli_history"
export REDISCLI_RCFILE="$XDG_CONFIG_HOME/redis/redisclirc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"

export MANPAGER="less -R --use-color -Dd+r -Du+b"

export EDITOR=nvim
export FNM_COREPACK_ENABLED=true

export FZF_DEFAULT_OPTS=" \
--color=bg+:#3b4261,spinner:#2ac3de,hl:#f7768e \
--color=fg:#c0caf5,header:#f7768e,info:#cba6f7,pointer:#2ac3de \
--color=marker:#2ac3de,fg+:#c0caf5,prompt:#cba6f7,hl+:#f7768e \
--color=separator:#3b4261,scrollbar:#2ac3de,border:#3b4261,label:#c0caf5 \
--prompt='  ' \
--info=right \
-i \
--reverse \
--padding 0,1
"
export FZF_CTRL_R_OPTS="--with-nth 2.."

if [ -d "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# PATH
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$GOPATH/bin" ]; then
  PATH="$GOPATH/bin:$PATH"
fi

if [ -d "$PNPM_HOME" ]; then
  PATH="$PNPM_HOME:$PATH"
fi

if [ -d "/usr/local/go/bin" ]; then
  PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "$XDG_DATA_HOME/fnm" ]; then
  PATH="$XDG_DATA_HOME/fnm:$PATH"
fi

if [ -d "$DENO_INSTALL/bin" ]; then
  PATH="$DENO_INSTALL/bin:$PATH"
fi

if [ -d "$BUN_INSTALL/bin" ]; then
  PATH="$BUN_INSTALL/bin:$PATH"
fi

if [ -d "/usr/local/zig" ]; then
  PATH="/usr/local/zig:$PATH"
fi

export PATH
