vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.skip_ts_context_commentstring_module = true
vim.g.tagalong_mappings = { "c", "C", "i", "a" }
vim.g.undotree_WindowLayout = 2

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.virtcolumn_char = "▕" -- by default

vim.opt.exrc = true
vim.opt.syntax = "on"
vim.opt.errorbells = false
vim.opt.showmode = false
vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.opt.undolevels = 1000
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.hidden = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess = vim.o.shortmess .. "c"
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.smartindent = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.list = false
vim.opt.cmdheight = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ttyfast = true
vim.opt.scrolloff = 10
vim.opt.backspace = "indent,eol,start"
vim.opt.showcmd = true
vim.opt.encoding = "utf-8"
vim.opt.background = "dark"
vim.opt.relativenumber = true
vim.opt.fillchars = "eob: "
vim.opt.colorcolumn = ""
vim.opt.guicursor = ""
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes:1"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.cursorline = false
vim.opt.listchars:append("tab:› ,trail:•,extends:#,nbsp:.,eol:↴,space:⋅")
vim.opt.equalalways = true
vim.opt.pumheight = 10

vim.diagnostic.config({
	virtual_text = {
		update_in_insert = true,
		underline = true,
		signs = true,
		source = true,
		format = function(diagnostic)
			return diagnostic.message .. ""
		end,
	},
})

vim.cmd([[
  filetype on
  filetype plugin on
  filetype plugin indent on
  set mps+=<:>
  set wildignore+=*/node_modules/**
  set mouse=
]])

-- EXTENSIONS
vim.filetype.add({ extension = { templ = "templ" } })

vim.g.codeium_filetypes = {
	TelescopePrompt = false,
}
