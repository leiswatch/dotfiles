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
--[[ vim.o.colorcolumn = "80" ]]
vim.opt.updatetime = 300
vim.opt.cursorline = false
vim.diagnostic.config({
	virtual_text = {
		update_in_insert = true,
		underline = true,
		signs = true,
		source = "if_many",
		prefix = "",
    format = function(diagnostic)
      return diagnostic.message .. " "
    end
	},
})
vim.g.virtcolumn_char = "▕" -- by default
vim.opt.listchars:append("tab:› ,trail:•,extends:#,nbsp:.,eol:↴,space:⋅")

-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.cmd([[
  " Catppuccin
  " autocmd ColorScheme * highlight NormalFloat guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight Normal guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight FloatBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight BufferOffset guibg=NONE
  " autocmd ColorScheme * highlight BufferTabpageFill guibg=NONE
  " autocmd ColorScheme * highlight TelescopeBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight TelescopePromptBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight TelescopePreviewBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight TelescopeResultsBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight LspInstallerHeader guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight ColorColumn ctermbg=0 guibg=#363A4F
  " autocmd ColorScheme * highlight LspFloatWinNormal guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight LspSagaHoverBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight LspSagaCodeActionBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight LspSagaLspFinderBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight LspSagaRenameBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight LspSagaDiagnosticBorder guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight WhichKey guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight WhichKeyGroup guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight WhichKeyFloat guibg=NONE guifg=#CAD3F5
  " autocmd ColorScheme * highlight WhichKeyBorder guibg=NONE guifg=#CAD3F5
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

  let g:neoformat_try_node_exe = 1
  let g:neoformat_run_all_formatters = 1

  let g:neoformat_basic_format_align = 1
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1

  let g:neoformat_enabled_python = ['yapf']
  let g:neoformat_enabled_lua = ['stylua']
  let g:neoformat_enabled_astro = ['prettier']
  let g:neoformat_enabled_css = ['stylelint']
  let g:neoformat_enabled_go = ['gofumpt', 'goimports']
  let g:neoformat_enabled_graphql = ['prettier']
  let g:neoformat_enabled_html = ['prettier']
  let g:neoformat_enabled_javascript = ['prettier']
  let g:neoformat_enabled_javascriptreact = ['prettier']
  let g:neoformat_enabled_typescript = ['prettier']
  let g:neoformat_enabled_typescriptreact = ['prettier']
  let g:neoformat_enabled_json = ['prettier']
  let g:neoformat_enabled_jsonc = ['prettier']
  let g:neoformat_enabled_less = ['stylelint']
  let g:neoformat_enabled_prisma = ['prettier']
  let g:neoformat_enabled_rust = ['rustfmt']
  let g:neoformat_enabled_sass = ['stylelint']
  let g:neoformat_enabled_scss = ['stylelint']
  let g:neoformat_enabled_yaml = ['prettier']
]])

require("leiswatch")

vim.cmd.colorscheme("catppuccin")
