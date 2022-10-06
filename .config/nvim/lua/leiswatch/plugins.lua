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
		use("wbthomason/packer.nvim")
		use("neovim/nvim-lspconfig")

		use("williamboman/mason.nvim")
		use("WhoIsSethDaniel/mason-tool-installer.nvim")
		use("jayp0521/mason-null-ls.nvim")
		use("RubixDev/mason-update-all")
		use("williamboman/mason-lspconfig.nvim")

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
		use("nvim-treesitter/nvim-treesitter-context")
		use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use("nvim-telescope/telescope-live-grep-args.nvim")
		use("kyazdani42/nvim-web-devicons")
		use("rcarriga/nvim-notify")
		use("folke/lua-dev.nvim")
		use("folke/which-key.nvim")
		use("onsails/lspkind.nvim")
		use("nvim-lualine/lualine.nvim")
		use("arkav/lualine-lsp-progress")
		use("lukas-reineke/indent-blankline.nvim")
		use("windwp/nvim-autopairs")
		use("windwp/nvim-ts-autotag")
		use({ "catppuccin/nvim", as = "catppuccin" })
		use("LunarVim/onedarker.nvim")
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
		--[[ use("romgrk/barbar.nvim") ]]
		use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
		use("karb94/neoscroll.nvim")
		use("folke/trouble.nvim")
		use("tpope/vim-fugitive")
		use("ThePrimeagen/harpoon")
		use("ThePrimeagen/git-worktree.nvim")
		use("petertriho/nvim-scrollbar")
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		use({
			"ghillb/cybu.nvim",
			branch = "main",
		})
		use("jose-elias-alvarez/typescript.nvim")
		use("nacro90/numb.nvim")
		use("folke/lsp-colors.nvim")
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
		})

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			prompt_border = "rounded",
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
