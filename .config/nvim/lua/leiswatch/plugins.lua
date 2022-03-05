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
  use {
    'David-Kunz/cmp-npm',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "lukas-reineke/cmp-rg" }
  use { "lukas-reineke/cmp-under-comparator" }
  use { 'hrsh7th/vim-vsnip-integ' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' }
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'glepnir/dashboard-nvim' }
  use { 'folke/lsp-colors.nvim' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  -- use { 'kyazdani42/nvim-tree.lua' }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'nvim-lualine/lualine.nvim' }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use { 'windwp/nvim-autopairs' }
  use { 'numToStr/Comment.nvim' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring'}
  use { 'romgrk/barbar.nvim' }
  -- use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils'}
  use { 'sunjon/shade.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'xiyaowong/nvim-cursorword' }
  use { 'David-Kunz/jester' }
  use { 'tamago324/lir.nvim' }
  use 'leafgarland/typescript-vim'
  use 'pangloss/vim-javascript'
  use 'peitalin/vim-jsx-typescript'
  use 'leafgarland/typescript-vim'
  use { 'styled-components/vim-styled-components', branch = 'main' }
  use { 'jparise/vim-graphql' }
end)
