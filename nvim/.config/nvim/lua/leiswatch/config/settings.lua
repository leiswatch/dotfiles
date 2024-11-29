vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.skip_ts_context_commentstring_module = true
vim.g.tagalong_mappings = { "c", "C", "i", "a" }
vim.g.undotree_WindowLayout = 2
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.virtcolumn_char = "▕" -- by default

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.colorcolumn = ""
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.cursorline = false
vim.opt.encoding = "utf-8"
vim.opt.equalalways = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.fillchars = "eob: "
vim.opt.guicursor = ""
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.list = false
-- vim.opt.listchars:append("tab:› ,trail:•,extends:#,nbsp:.,eol:↴,space:⋅")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.pumheight = 10
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.shortmess = vim.o.shortmess .. "c"
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes:1"
vim.opt.smartcase = true
vim.opt.smartindent = false
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.syntax = "on"
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.ttyfast = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.updatetime = 250
vim.opt.wrap = true
vim.opt.wildignore:append("*/node_modules/**")
vim.opt.matchpairs:append("<:>")
vim.opt.mouse = "a"

vim.opt.foldmethod = "manual"
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("filetype plugin indent on")

vim.filetype.add({ extension = { templ = "templ" } })

vim.lsp.log.set_level(vim.log.levels.OFF)

vim.diagnostic.config({
	virtual_text = {
		update_in_insert = false,
		underline = true,
		signs = true,
		source = false,
		spacing = 0,
		format = function(diagnostic)
			local source = ""
			local sourceCapitalized = ""

			if diagnostic.source ~= nil then
				source = diagnostic.source:gsub("%.", "")
				sourceCapitalized = source:lower() .. ": "
			end

			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				-- return " " .. sourceCapitalized .. diagnostic.message .. " "
				return " " .. sourceCapitalized .. diagnostic.message .. " "
			end
			if diagnostic.severity == vim.diagnostic.severity.WARN then
				-- return " " .. sourceCapitalized .. diagnostic.message .. " "
				return " " .. sourceCapitalized .. diagnostic.message .. " "
			end
			if diagnostic.severity == vim.diagnostic.severity.HINT then
				-- return " " .. sourceCapitalized .. diagnostic.message .. " "
				return " " .. sourceCapitalized .. diagnostic.message .. " "
			end
			if diagnostic.severity == vim.diagnostic.severity.INFO then
				-- return " " .. sourceCapitalized .. diagnostic.message .. " "
				return " " .. sourceCapitalized .. diagnostic.message .. " "
			end

			return " " .. sourceCapitalized .. diagnostic.message .. " "
		end,
		prefix = "",
	},
})
