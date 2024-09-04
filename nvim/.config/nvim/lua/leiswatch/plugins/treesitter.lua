return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
		"numToStr/Comment.nvim",
		"andymass/vim-matchup",
		"windwp/nvim-autopairs",
		-- "HiPhish/rainbow-delimiters.nvim",
	},

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"go",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"rust",
				"scss",
				"templ",
				"tsx",
				"typescript",
				"vim",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			matchup = {
				enable = false,
				include_match_words = false,
			},
			modules = {},
			ignore_install = {},
		})

		require("treesitter-context").setup({
			enable = true,
			multiline_threshold = 3,
			max_lines = 3,
			separator = nil,
			mode = "topline",
		})

		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "FzfLuaFzfPrompt" },
		})

		require("Comment").setup({
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = false, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
		})
	end,
}
