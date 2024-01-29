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
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
			"windwp/nvim-ts-autotag",
			"windwp/nvim-autopairs",
			"andymass/vim-matchup",
			"numToStr/Comment.nvim",
		},
	},

	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"pontusk/cmp-sass-variables",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},

	{ "nvim-lualine/lualine.nvim" },
	{ "j-hui/fidget.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				version = "*",
			},
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "NvChad/nvim-colorizer.lua" },
	{ "lewis6991/gitsigns.nvim" },
	{ "kylechui/nvim-surround", version = "*" },
	{ "folke/trouble.nvim" },
	{ "famiu/bufdelete.nvim" },
	{ "kevinhwang91/nvim-bqf" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			{
				"s1n7ax/nvim-window-picker",
				version = "v2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
	},
	{ "mbbill/undotree" },
	{ "asiryk/auto-hlsearch.nvim" },
	{ "j-morano/buffer_manager.nvim" },
	{ "folke/todo-comments.nvim", event = "VeryLazy" },
	{ "sindrets/diffview.nvim" },
	{ "tpope/vim-fugitive" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-go",
		},
	},
	{ "goolord/alpha-nvim" },
	{ "AndrewRadev/tagalong.vim" },
	{ "folke/noice.nvim", event = "VeryLazy" },
	{ "nvimtools/none-ls.nvim" },
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	-- { "stevearc/conform.nvim" },
	-- { "mfussenegger/nvim-lint" },
	-- { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = "BufEnter",
	-- },
	-- { "sbdchd/neoformat" },
	-- { "lukas-reineke/indent-blankline.nvim", branch = "v3" },
	-- { "HiPhish/rainbow-delimiters.nvim" },
}, {
	ui = {
		size = { width = 0.75, height = 0.75 },
		wrap = true,
		border = "rounded",
	},
	install = {
		missing = true,
	},
})
