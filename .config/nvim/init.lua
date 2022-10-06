vim.o.exrc = true
vim.o.syntax = "on"
vim.o.errorbells = false
vim.o.showmode = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.autoindent = true
vim.o.autoread = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.number = true
vim.o.wrap = false
vim.opt.termguicolors = true
vim.o.laststatus = 3
vim.o.list = false
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ttyfast = true
vim.o.scrolloff = 10
vim.o.backspace = "indent,eol,start"
vim.o.showcmd = true
vim.o.encoding = "utf-8"
vim.o.background = "dark"
vim.o.relativenumber = true
vim.o.fillchars = "eob: "
vim.o.guicursor = ""
vim.o.hlsearch = false
vim.o.wrap = false
vim.o.signcolumn = "yes"
--[[ vim.o.colorcolumn = "80" ]]
vim.opt.updatetime = 300
vim.opt.cursorline = false
vim.diagnostic.config({
	virtual_text = {
		prefix = "",
		update_in_insert = false,
		underline = true,
		signs = false,
		source = true,
		float = {
			border = "rounded",
		},
	},
})
vim.g.virtcolumn_char = "▕" -- by default
vim.opt.listchars:append("tab:› ,trail:•,extends:#,nbsp:.,eol:↴,space:⋅")

-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.notify = require("notify")

require("leiswatch")

vim.cmd([[
  " Catppuccin
  autocmd ColorScheme * highlight NormalFloat guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight Normal guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight FloatBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight BufferOffset guibg=#24273A
  autocmd ColorScheme * highlight BufferTabpageFill guibg=#24273A
  autocmd ColorScheme * highlight TelescopeBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight TelescopePromptBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight TelescopePreviewBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight TelescopeResultsBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight LspInstallerHeader guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight ColorColumn ctermbg=0 guibg=#363A4F
  autocmd ColorScheme * highlight LspFloatWinNormal guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight LspSagaHoverBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight LspSagaCodeActionBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight LspSagaLspFinderBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight LspSagaRenameBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight LspSagaDiagnosticBorder guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight WhichKey guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight WhichKeyGroup guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight WhichKeyFloat guibg=#24273A guifg=#CAD3F5
  autocmd ColorScheme * highlight WhichKeyBorder guibg=#24273A guifg=#CAD3F5

  autocmd FileType alpha setlocal nofoldenable

  filetype on
  filetype plugin on
  filetype plugin indent on
  set shortmess+=c
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

  let g:lazygit_floating_window_scaling_factor = 0.75
  let test#strategy = "neovim"
  let test#neovim#term_position = "vert"
  let g:test#neovim#start_normal = 1 " If using neovim strategy
  let g:floaterm_wintype = 'split'

  colorscheme catppuccin
  
	autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
]])
