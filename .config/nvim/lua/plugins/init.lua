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
	{ "stevearc/dressing.nvim", event = "BufEnter" },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = {
			strict = true,
			override_by_extension = {
				["astro"] = {
					icon = "",
					color = "#f1502f",
					name = "Astro",
				},
			},
		},
	},
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
	{ "stevearc/conform.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "pmizio/typescript-tools.nvim" },
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
			-- "hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"FelipeLema/cmp-async-path",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"pontusk/cmp-sass-variables",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},
	{
		"jdrupal-dev/css-vars.nvim",
		config = function()
			require("css-vars").setup()
		end,
	},
	{ "nvim-lualine/lualine.nvim" },
	{ "j-hui/fidget.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	-- { "ibhagwan/fzf-lua" },
	{ "ThePrimeagen/harpoon", branch = "harpoon2" },
	{ "NvChad/nvim-colorizer.lua" },
	{ "lewis6991/gitsigns.nvim" },
	{ "kylechui/nvim-surround", version = "*" },
	{ "famiu/bufdelete.nvim" },
	{ "kevinhwang91/nvim-bqf" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{ "mbbill/undotree" },
	{ "asiryk/auto-hlsearch.nvim", event = "BufRead", opts = { create_commands = false } },
	{ "j-morano/buffer_manager.nvim" },
	{ "folke/todo-comments.nvim", event = "BufEnter" },
	{ "sindrets/diffview.nvim" },
	{ "tpope/vim-fugitive" },
	{ "nvim-pack/nvim-spectre" },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.keymap.set("i", "<Tab>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	},
	{ "goolord/alpha-nvim" },
	{ "folke/noice.nvim" },

	-- { "nvimtools/none-ls.nvim" },
	-- { "folke/trouble.nvim" },
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"haydenmeade/neotest-jest",
	-- 		"nvim-neotest/neotest-go",
	-- 	},
	-- },
	-- { "sbdchd/neoformat" },
}, {
	ui = {
		size = { width = 0.75, height = 0.75 },
		wrap = true,
		border = "single",
	},
	install = {
		missing = true,
	},
})
