local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "neovim/nvim-lspconfig" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "jayp0521/mason-null-ls.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "rafamadriz/friendly-snippets" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	{ "windwp/nvim-autopairs" },
	{ "numToStr/Comment.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "j-hui/fidget.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "ThePrimeagen/harpoon" },
	{ "NvChad/nvim-colorizer.lua" },
	{ "lewis6991/gitsigns.nvim" },
	{ "goolord/alpha-nvim" },
	{ "sbdchd/neoformat" },
	{ "kylechui/nvim-surround", version = "*" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
	},
	{ "folke/trouble.nvim" },
	{ "famiu/bufdelete.nvim" },
	{ "kevinhwang91/nvim-bqf" },
	{ "tpope/vim-fugitive" },
	{ "MunifTanjim/nui.nvim" },
	{ "folke/noice.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
	},
	{ "s1n7ax/nvim-window-picker", version = "v1.*" },
	{ "folke/which-key.nvim" },
	{ "mbbill/undotree" },
	{ "andymass/vim-matchup" },
	{ "asiryk/auto-hlsearch.nvim" },
	-- { "windwp/nvim-spectre" },
	{ "akinsho/git-conflict.nvim" },
	{ "j-morano/buffer_manager.nvim" },
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
	},
	{ "folke/todo-comments.nvim" },
}, {
	ui = {
		size = { width = 0.8, height = 0.8 },
		wrap = true,
		border = "single",
	},
})
