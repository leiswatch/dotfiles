local vim = vim
local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = true
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.wrap = false
vim.opt.termguicolors = true
o.laststatus = 2
o.list = true
o.cmdheight = 2
o.splitbelow = true
o.ttyfast = true
o.scrolloff = 5
o.backspace = "indent,eol,start"
o.showcmd = true
o.encoding = "utf-8"

vim.g.nvim_tree_width = 50

require'leiswatch'

vim.cmd[[
  colorscheme catppuccin

  filetype on
  filetype plugin on
  filetype plugin indent on

  set shortmess+=c
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]]

vim.g.bufferline = {
  auto_hide = true,
  insert_at_end = true,
  exclude_ft = {'NvimTree'},
  exclude_name = {'File Tree'}
}

vim.g.nvim_tree_quit_on_open = 1
