return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use 'tami5/lspsaga.nvim'
use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
use 'projekt0n/github-nvim-theme'
use 'kosayoda/nvim-lightbulb'
use 'folke/lsp-colors.nvim'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'
use "rafamadriz/friendly-snippets"
use "onsails/lspkind-nvim"
use "kyazdani42/nvim-web-devicons"
use "goolord/alpha-nvim"
use "lukas-reineke/indent-blankline.nvim"
use 'kyazdani42/nvim-tree.lua'
use 'karb94/neoscroll.nvim'
use 'windwp/nvim-ts-autotag'
use 'windwp/nvim-autopairs'
-- use 'McAuleyPenney/tidy.nvim'
use "jose-elias-alvarez/null-ls.nvim"
use "xiyaowong/nvim-transparent"
end)
