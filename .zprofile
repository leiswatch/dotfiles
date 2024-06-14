export PNPM_HOME="$HOME/.local/share/pnpm"
export GOPATH="$HOME/.go"
export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"

export FNM_COREPACK_ENABLED=true

# Mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=separator:#45475a,scrollbar:#45475a,border:#313244,label:#cdd6f4 \
--pointer= \
--prompt='  ' \
--info=inline-right \
-i \
--reverse"

# Tokyonight
# export FZF_DEFAULT_OPTS="
#   --color=bg+:#283457 \
#   --color=border:#27a1b9 \
#   --color=fg:#c0caf5 \
#   --color=gutter:#16161e \
#   --color=header:#ff9e64 \
#   --color=hl+:#2ac3de \
#   --color=hl:#2ac3de \
#   --color=info:#545c7e \
#   --color=marker:#ff007c \
#   --color=pointer:#ff007c \
#   --color=prompt:#2ac3de \
#   --color=query:#c0caf5:regular \
#   --color=scrollbar:#27a1b9 \
#   --color=separator:#ff9e64 \
#   --color=spinner:#ff007c \
#   --pointer= \
#   --prompt='  ' \
#   --info=inline-right \
#   -i \
#   --reverse"

# PATH="$DENO_INSTALL/bin:$PNPM_HOME:$BUN_INSTALL/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
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

if [ -d "$HOME/.local/share/fnm" ]; then
	PATH="$HOME/.local/share/fnm:$PATH"
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
