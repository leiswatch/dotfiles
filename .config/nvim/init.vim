runtime ./plug.vim
runtime ./maps.vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
syntax on
" let g:everforest_background = 'soft'
let g:everforest_enable_italic = 0
let g:everforest_disable_italic_comment = 1
let g:everforest_transparent_background = 1
let g:everforest_sign_column_background = 'none'
let g:everforest_diagnostic_text_highlight = 0
let g:everforest_diagnostic_line_highlight = 0
let g:everforest_current_word = 'bold'
let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_better_performance = 1
colorscheme everforest

highlight Normal guibg=none
highlight NonText guibg=none

set nocompatible
set splitbelow
filetype off
filetype plugin on
let mapleader = ","
set textwidth=100
set ttyfast
set scrolloff=5
set backspace=indent,eol,start
set laststatus=2
set showmode
set showcmd

set matchpairs+=<:>

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set number relativenumber
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set viminfo='100,<9999,s100

set hidden
set nobackup
set nowritebackup
set encoding=utf-8
set cmdheight=2
set updatetime=300
set shortmess+=c
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent

if has("autocmd")
  filetype plugin indent on
endif

autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead *.pp set filetype=puppet
au BufRead,BufNewFile *.py set expandtab
