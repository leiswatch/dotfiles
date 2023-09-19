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
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "neovim/nvim-lspconfig" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "nvim-lualine/lualine.nvim" },
	{ "numToStr/Comment.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "j-hui/fidget.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "ThePrimeagen/harpoon" },
	{ "NvChad/nvim-colorizer.lua" },
	{ "lewis6991/gitsigns.nvim" },
	{ "kylechui/nvim-surround", version = "*" },
	{ "folke/trouble.nvim" },
	{ "famiu/bufdelete.nvim" },
	{ "kevinhwang91/nvim-bqf" },
	{ "MunifTanjim/nui.nvim" },
	{ "folke/noice.nvim" },
	{ "nvim-neo-tree/neo-tree.nvim", branch = "v3.x" },
	{ "mbbill/undotree" },
	{ "asiryk/auto-hlsearch.nvim" },
	{ "j-morano/buffer_manager.nvim" },
	{ "folke/todo-comments.nvim" },
	{ "pontusk/cmp-sass-variables" },
	{ "sindrets/diffview.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "NeogitOrg/neogit" },
	{ "windwp/nvim-autopairs" },
	{ "andymass/vim-matchup" },
	{ "goolord/alpha-nvim" },
	{ "sbdchd/neoformat" },
	{ "antoinemadec/FixCursorHold.nvim" },
	{ "nvim-neotest/neotest" },
	{ "haydenmeade/neotest-jest" },
	{ "nvim-neotest/neotest-go" },
	-- { "lukas-reineke/indent-blankline.nvim", branch = "v3" },
	-- { "HiPhish/rainbow-delimiters.nvim" },
	-- { "mhartington/formatter.nvim" },
}, {
	ui = {
		size = { width = 0.75, height = 0.75 },
		wrap = true,
		border = "rounded",
	},
	install = {
		missing = true,
	},
	defaults = {
		lazy = false,
	},
})
