call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'norcalli/snippets.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'simrat39/rust-tools.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'onsails/lspkind-nvim'
Plug 'romgrk/barbar.nvim'
Plug 'yamatsum/nvim-cursorline'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'b3nj5m1n/kommentary'
Plug 'karb94/neoscroll.nvim'
Plug 'ahmedkhalf/lsp-rooter.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'windwp/nvim-autopairs'
Plug 'dense-analysis/ale'
Plug 'hoob3rt/lualine.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'cespare/vim-toml'
Plug 'jparise/vim-graphql'
" Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'

Plug 'wojciechkepka/vim-github-dark'
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/edge'
Plug 'tjdevries/colorbuddy.vim'
Plug 'bkegley/gloombuddy'
Plug 'Mofiqul/vscode.nvim'
Plug 'tjdevries/gruvbuddy.nvim'

call plug#end()

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
syntax on
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
let g:edge_transparent_background = 1
let g:vscode_style = "dark"
colorscheme onedark

" lua require('colorbuddy').colorscheme('gruvbuddy')

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

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nmap te :tabnew<CR>
nnoremap <leader><Space> :noh<cr>

inoremap jj <esc>
inoremap kj <esc>
inoremap JJ <esc>
inoremap KJ <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w" Move window

map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>

" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>

" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>

" Sort automatically by...
nnoremap <silent> <leader>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <leader>bl :BufferOrderByLanguage<CR>

autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead *.pp set filetype=puppet
