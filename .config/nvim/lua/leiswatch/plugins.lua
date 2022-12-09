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
		use({ "catppuccin/nvim", as = "catppuccin" })
		use("windwp/nvim-autopairs")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("L3MON4D3/LuaSnip")
		use("RubixDev/mason-update-all")
		use("ThePrimeagen/git-worktree.nvim")
		use("ThePrimeagen/harpoon")
		use("WhoIsSethDaniel/mason-tool-installer.nvim")
		use("famiu/bufdelete.nvim")
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
		use("kyazdani42/nvim-web-devicons")
		use("lewis6991/gitsigns.nvim")
		use("mbbill/undotree")
		use("nacro90/numb.nvim")
		use("neovim/nvim-lspconfig")
		use("nkakouros-original/numbers.nvim")
		use("NvChad/nvim-colorizer.lua")
		use("numToStr/Comment.nvim")
		use("nvim-lualine/lualine.nvim")
		use("nvim-treesitter/nvim-treesitter-context")
		use("onsails/lspkind.nvim")
		use("p00f/nvim-ts-rainbow")
		use("rafamadriz/friendly-snippets")
		use("saadparwaiz1/cmp_luasnip")
		use("sbdchd/neoformat")
		use("stevearc/dressing.nvim")
		use("tpope/vim-fugitive")
		use("vim-test/vim-test")
		use("wbthomason/packer.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("williamboman/mason.nvim")
		use("windwp/nvim-ts-autotag")
		use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
		})
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
		})
		use("lvimuser/lsp-inlayhints.nvim")
		use({
			"kylechui/nvim-surround",
			tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		})
		use("nvim-treesitter/nvim-treesitter-textobjects")
		--[[ use("arkav/lualine-lsp-progress") ]]
		--[[ use("folke/lsp-colors.nvim") ]]
		--[[ use("folke/lua-dev.nvim") ]]
		--[[ use("jose-elias-alvarez/nvim-lsp-ts-utils") ]]
		--[[ use("folke/tokyonight.nvim") ]]
		--[[ use("lukas-reineke/cmp-rg") ]]
		--[[ use("lukas-reineke/indent-blankline.nvim") ]]
		--[[ use("petertriho/nvim-scrollbar") ]]
		--[[ use("ray-x/go.nvim") ]]
		--[[ use("sheerun/vim-polyglot") ]]

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
