return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  }) 
  use{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'onsails/lspkind-nvim' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip-integ' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' }
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'glepnir/dashboard-nvim' }
  use { 'folke/lsp-colors.nvim' }
end)
