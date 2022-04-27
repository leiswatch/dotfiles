vim.cmd([[
  if exists('g:vscode') 
  else
    lua require("leiswatch")
  endif
]])

vim.o.syntax = "on"
vim.o.errorbells = false
vim.o.smartcase = true
vim.o.showmode = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.wo.number = true
vim.wo.wrap = false
vim.opt.termguicolors = true
vim.o.laststatus = 2
vim.o.list = true
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ttyfast = true
vim.o.scrolloff = 5
vim.o.backspace = "indent,eol,start"
vim.o.showcmd = true
vim.o.encoding = "utf-8"
vim.o.background = "dark"
vim.o.relativenumber = true
vim.wo.fillchars = "eob: "

vim.cmd([[
  if exists('g:vscode')
  else
    filetype on
    filetype plugin on
    filetype plugin indent on
    set shortmess+=c
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

    autocmd BufWritePre *.lua,*.py,*.go,*.rs,*.js,*.ts,*.jsx,*.tsx,*.scss,*.css lua vim.lsp.buf.formatting_sync()
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  endif

  autocmd FileType alpha setlocal nofoldenable
  let g:lazygit_floating_window_scaling_factor = 0.75
]])
-- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

-- require("onedarkpro").load()
