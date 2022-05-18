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
vim.o.laststatus = 2
vim.o.list = true
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

require("leiswatch")

vim.cmd([[
  filetype on
  filetype plugin on
  filetype plugin indent on
  set shortmess+=c
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

  autocmd FileType alpha setlocal nofoldenable
  let g:lazygit_floating_window_scaling_factor = 0.75
  let test#strategy = "neovim"
  let test#neovim#term_position = "vert"
  let g:test#neovim#start_normal = 1 " If using neovim strategy
  let g:floaterm_wintype = 'split'
  colorscheme catppuccin
]])
