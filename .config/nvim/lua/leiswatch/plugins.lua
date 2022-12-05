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

return require("packer").startup({
	function(use)
		use("windwp/nvim-autopairs")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("L3MON4D3/LuaSnip")
		use("LunarVim/onedarker.nvim")
		use("RubixDev/mason-update-all")
		use("ThePrimeagen/git-worktree.nvim")
		use("ThePrimeagen/harpoon")
		use("WhoIsSethDaniel/mason-tool-installer.nvim")
		use("arkav/lualine-lsp-progress")
		use("f-person/git-blame.nvim")
		use("famiu/bufdelete.nvim")
		use("folke/lsp-colors.nvim")
		use("folke/lua-dev.nvim")
		use("folke/tokyonight.nvim")
		use("folke/trouble.nvim")
		use("folke/which-key.nvim")
		use("goolord/alpha-nvim")
		use("gpanders/editorconfig.nvim")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-path")
		use("hrsh7th/nvim-cmp")
		use("j-hui/fidget.nvim")
		use("jayp0521/mason-null-ls.nvim")
		use("jose-elias-alvarez/null-ls.nvim")
		use("jose-elias-alvarez/nvim-lsp-ts-utils")
		use("kyazdani42/nvim-web-devicons")
		use("lewis6991/gitsigns.nvim")
		use("lukas-reineke/cmp-rg")
		use("lukas-reineke/indent-blankline.nvim")
		use("mbbill/undotree")
		use("nacro90/numb.nvim")
		use("neovim/nvim-lspconfig")
		use("nkakouros-original/numbers.nvim")
		use("norcalli/nvim-colorizer.lua")
		use("numToStr/Comment.nvim")
		use("nvim-lualine/lualine.nvim")
		use("nvim-treesitter/nvim-treesitter-context")
		use("onsails/lspkind.nvim")
		use("p00f/nvim-ts-rainbow")
		use("petertriho/nvim-scrollbar")
		use("rafamadriz/friendly-snippets")
		use("ray-x/go.nvim")
		use("saadparwaiz1/cmp_luasnip")
		use("sbdchd/neoformat")
		use("sheerun/vim-polyglot")
		use("stevearc/dressing.nvim")
		use("tpope/vim-fugitive")
		use("vim-test/vim-test")
		use("wbthomason/packer.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("williamboman/mason.nvim")
		use("windwp/nvim-ts-autotag")
		use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
		use({ "catppuccin/nvim", as = "catppuccin" })
		use({ "kevinhwang91/nvim-bqf" })
		use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		use({
			"utilyre/barbecue.nvim",
			requires = {
				"neovim/nvim-lspconfig",
				"smiteshp/nvim-navic",
				"kyazdani42/nvim-web-devicons", -- optional
			},
			config = function()
				require("barbecue").setup()
			end,
		})

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		max_jobs = 10,
		display = {
			prompt_border = "rounded",
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
