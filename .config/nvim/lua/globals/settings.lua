vim.g.mapleader = " "
vim.o.exrc = true
vim.o.syntax = "on"
vim.o.errorbells = false
vim.o.showmode = true
vim.o.swapfile = true
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
vim.o.smartindent = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.number = true
vim.o.wrap = true
vim.o.termguicolors = true
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
vim.o.colorcolumn = ""
vim.o.guicursor = ""
vim.o.hlsearch = false
vim.o.wrap = false
vim.o.signcolumn = "yes:2"
vim.o.updatetime = 50
vim.o.cursorline = false
vim.diagnostic.config({
	virtual_text = {
		update_in_insert = true,
		underline = true,
		signs = true,
		source = true,
		-- prefix = "",
		format = function(diagnostic)
			return diagnostic.message .. ""
		end,
	},
})
vim.g.virtcolumn_char = "▕" -- by default
vim.opt.listchars:append("tab:› ,trail:•,extends:#,nbsp:.,eol:↴,space:⋅")
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.opt.equalalways = true
vim.o.pumheight = 10

vim.cmd([[
  filetype on
  filetype plugin on
  filetype plugin indent on
  set mps+=<:>
  set wildignore+=*/node_modules/**
  set mouse=
]])

vim.g.skip_ts_context_commentstring_module = true
vim.g.tagalong_mappings = { "c", "C", "i", "a" }
