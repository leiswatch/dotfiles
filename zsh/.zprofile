export PNPM_HOME="$HOME/.local/share/pnpm"
export GOPATH="$HOME/.go"
export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"

export FNM_COREPACK_ENABLED=true
export ASDF_NODEJS_AUTO_ENABLE_COREPACK=true
export EDITOR=nvim

# Mocha
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#89b4fa \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --color=separator:#313244,scrollbar:#f5e0dc,border:#313244,label:#cdd6f4 \
# --prompt='  ' \
# --info=right \
# -i \
# --reverse \
# --padding 0,1"

# Tokyonight
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

if [ -d "$GOPATH/bin" ] ; then
  PATH="$GOPATH/bin:$PATH"
fi

if [ -d "$PNPM_HOME" ] ; then
  PATH="$PNPM_HOME:$PATH"
fi

if [ -d "/usr/local/go/bin" ] ; then
  PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "$HOME/.local/share/fnm" ] ; then
  PATH="$HOME/.local/share/fnm:$PATH"
fi

if [ -d "$DENO_INSTALL/bin" ] ; then
  PATH="$DENO_INSTALL/bin:$PATH"
fi

if [ -d "$BUN_INSTALL/bin" ] ; then
  PATH="$BUN_INSTALL/bin:$PATH"
fi

if [ -d "/usr/local/zig" ] ; then
  PATH="/usr/local/zig:$PATH"
fi

export PATH
