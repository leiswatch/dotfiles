local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("olimorris/onedarkpro.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("lukas-reineke/cmp-rg")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("kyazdani42/nvim-web-devicons")
	-- use({
	-- 	"yamatsum/nvim-nonicons",
	-- 	requires = { "kyazdani42/nvim-web-devicons" },
	-- })
	use("onsails/lspkind.nvim")
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("Mofiqul/vscode.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("f-person/git-blame.nvim")
	use("lewis6991/gitsigns.nvim")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("jose-elias-alvarez/null-ls.nvim")
	use("kdheepak/lazygit.nvim")
	use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
	use("famiu/bufdelete.nvim")
	use("goolord/alpha-nvim")
	use("p00f/nvim-ts-rainbow")
	use("sheerun/vim-polyglot")
	use("ray-x/go.nvim")
	use("stevearc/dressing.nvim")
	use("nkakouros-original/numbers.nvim")
	use("gpanders/editorconfig.nvim")
	use("vim-test/vim-test")
	use("voldikss/vim-floaterm")
	use("romgrk/barbar.nvim")
	use("karb94/neoscroll.nvim")
	use("folke/trouble.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("tpope/vim-fugitive")
	use("ThePrimeagen/harpoon")
	use("ThePrimeagen/git-worktree.nvim")
	use("petertriho/nvim-scrollbar")
	use({
		"ghillb/cybu.nvim",
		branch = "main",
	})
	use("jose-elias-alvarez/typescript.nvim")
	use("folke/tokyonight.nvim")
	-- use("lukas-reineke/virt-column.nvim")
	-- use("xiyaowong/virtcolumn.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
