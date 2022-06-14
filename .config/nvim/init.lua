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
vim.o.colorcolumn = "80"
vim.opt.updatetime = 300
vim.opt.cursorline = false
vim.g.catppuccin_flavour = "mocha"
vim.diagnostic.config({
	virtual_text = {
		prefix = "",
		update_in_insert = true,
		signs = true,
		source = "if_many",
		float = {
			border = "rounded",
		},
	},
})
vim.g.virtcolumn_char = "▕" -- by default
vim.opt.listchars:append("tab:› ,trail:•,extends:#,nbsp:.,eol:↴,space:⋅")

vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 0
vim.g.vscode_disable_nvimtree_bg = true

-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = false
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_lualine_bold = true
-- vim.g.tokyonight_italic_keywords = false
-- vim.g.tokyonight_italic_comments = false
-- vim.g.tokyonight_dark_float = false
-- vim.g.tokyonight_colors = {
-- 	bg_float = "none",
-- }

require("leiswatch")

vim.cmd([[
  " Catppuccin
  autocmd ColorScheme * highlight NormalFloat guibg=#1E1E2E guifg=#C6D0F5
  autocmd ColorScheme * highlight FloatBorder guibg=#1E1E2E guifg=#C6D0F5
  autocmd ColorScheme * highlight DiagnosticError guibg=#1E1E2E
  autocmd ColorScheme * highlight DiagnosticWarn guibg=#1E1E2E
  autocmd ColorScheme * highlight DiagnosticInfo guibg=#1E1E2E
  autocmd ColorScheme * highlight DiagnosticHint guibg=#1E1E2E
  autocmd ColorScheme * highlight BufferOffset guibg=#1E1E2E
  autocmd ColorScheme * highlight BufferTabpageFill guibg=#1E1E2E
  autocmd ColorScheme * highlight TelescopeBorder guibg=#1E1E2E guifg=#C6D0F5
  autocmd ColorScheme * highlight TelescopePromptBorder guibg=#1E1E2E guifg=#C6D0F5
  autocmd ColorScheme * highlight TelescopePreviewBorder guibg=#1E1E2E guifg=#C6D0F5
  autocmd ColorScheme * highlight TelescopeResultsBorder guibg=#1E1E2E guifg=#C6D0F5
  autocmd ColorScheme * highlight LspInstallerHeader guibg=#1E1E2E guifg=#C6D0F5
  autocmd ColorScheme * highlight ColorColumn ctermbg=0 guibg=#313244

  " Tokyonight
  " autocmd ColorScheme * highlight NormalFloat guibg=#24283b guifg=#C0CAF5
  " autocmd ColorScheme * highlight FloatBorder guibg=#24283b guifg=#C0CAF5
  " autocmd ColorScheme * highlight DiagnosticError guibg=#24283b
  " autocmd ColorScheme * highlight DiagnosticWarn guibg=#24283b
  " autocmd ColorScheme * highlight DiagnosticInfo guibg=#24283b
  " autocmd ColorScheme * highlight DiagnosticHint guibg=#24283b
  " autocmd ColorScheme * highlight BufferOffset guibg=#24283b
  " autocmd ColorScheme * highlight BufferTabpageFill guibg=#24283b
  " autocmd ColorScheme * highlight TelescopeBorder guibg=#24283b guifg=#C0CAF5
  " autocmd ColorScheme * highlight TelescopePromptBorder guibg=#24283b guifg=#C0CAF5
  " autocmd ColorScheme * highlight TelescopePreviewBorder guibg=#24283b guifg=#C0CAF5
  " autocmd ColorScheme * highlight TelescopeResultsBorder guibg=#24283b guifg=#C0CAF5
  " autocmd ColorScheme * highlight LspInstallerHeader guibg=#24283b guifg=#C0CAF5
  " autocmd ColorScheme * highlight ColorColumn ctermbg=0 guibg=#1f2335
  " autocmd ColorScheme * highlight ColorColumn ctermbg=0 guibg=NONE
  " autocmd ColorScheme * highlight VirtColumn ctermbg=0 guibg=#1f2335

  " VS Code
  " autocmd ColorScheme * highlight NormalFloat guibg=#1E1E1E guifg=#D4D4D4
  " autocmd ColorScheme * highlight FloatBorder guibg=#1E1E1E guifg=#D4D4D4
  " autocmd ColorScheme * highlight DiagnosticError guibg=#1E1E1E
  " autocmd ColorScheme * highlight DiagnosticWarn guibg=#1E1E1E
  " autocmd ColorScheme * highlight DiagnosticInfo guibg=#1E1E1E
  " autocmd ColorScheme * highlight DiagnosticHint guibg=#1E1E1E
  " autocmd ColorScheme * highlight BufferOffset guibg=#1E1E1E
  " autocmd ColorScheme * highlight BufferTabpageFill guibg=#1E1E1E
  " autocmd ColorScheme * highlight TelescopeBorder guibg=#1E1E1E guifg=#D4D4D4
  " autocmd ColorScheme * highlight TelescopePromptBorder guibg=#1E1E1E guifg=#D4D4D4
  " autocmd ColorScheme * highlight TelescopePreviewBorder guibg=#1E1E1E guifg=#D4D4D4
  " autocmd ColorScheme * highlight TelescopeResultsBorder guibg=#1E1E1E guifg=#D4D4D4
  " autocmd ColorScheme * highlight LspInstallerHeader guibg=#1E1E1E guifg=#D4D4D4

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
