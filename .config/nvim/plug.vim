let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'romgrk/barbar.nvim'
  Plug 'airblade/vim-rooter'
  Plug 'cespare/vim-toml'
  Plug 'jparise/vim-graphql'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/lsp-trouble.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-surround'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'jiangmiao/auto-pairs'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'yamatsum/nvim-cursorline'
  Plug 'f-person/git-blame.nvim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'p00f/nvim-ts-rainbow'

  " Colorschemes
  Plug 'tjdevries/colorbuddy.vim'
  " Plug 'bkegley/gloombuddy'
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/edge'
  Plug 'sainnhe/everforest'
call plug#end()
