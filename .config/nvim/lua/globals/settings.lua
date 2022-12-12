vim.g.mapleader = " "
vim.o.exrc = true
vim.o.syntax = "on"
vim.o.errorbells = false
vim.o.showmode = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.o.undolevels = 1000
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.autoindent = true
vim.o.autoread = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.number = true
vim.o.wrap = true
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
vim.opt.updatetime = 300
vim.opt.cursorline = false
vim.diagnostic.config({
	virtual_text = {
		update_in_insert = true,
		underline = true,
		signs = true,
		source = true,
		prefix = "",
		format = function(diagnostic)
			return diagnostic.message .. " "
		end,
	},
})
vim.g.virtcolumn_char = "▕" -- by default
vim.opt.listchars:append("tab:› ,trail:•,extends:#,nbsp:.,eol:↴,space:⋅")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
  " Catppuccin
  autocmd ColorScheme * highlight LspInlayHint guibg=NONE guifg=#a6adc8
  autocmd ColorScheme * highlight DiagnosticVirtualTextError guibg=#32283a
  autocmd ColorScheme * highlight DiagnosticVirtualTextWarn guibg=#33313a
  autocmd ColorScheme * highlight DiagnosticVirtualTextHint guibg=#29313e

  autocmd FileType alpha setlocal nofoldenable

  filetype on
  filetype plugin on
  filetype plugin indent on
  set shortmess+=c
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

  set wildignore+=*/node_modules/**

  let test#strategy = "neovim"
  let test#neovim#term_position = "vert"
  let g:test#neovim#start_normal = 1 " If using neovim strategy

	autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
]])
