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
		"windwp/nvim-autopairs",
		"numToStr/Comment.nvim",
		"andymass/vim-matchup",
	},

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"javascript",
				"typescript",
				"css",
				"scss",
				"graphql",
				"python",
				"tsx",
				"rust",
				"go",
				"lua",
				"vim",
				"markdown",
				"markdown_inline",
				"regex",
				"bash",
				"astro",
				"html",
				"templ",
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
			autotag = {
				enable = true,
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
			matchup = {
				enable = true,
				include_match_words = true,
			},
		})

		require("treesitter-context").setup({
			enable = true,
			multiline_threshold = 3,
			max_lines = 3,
			separator = nil,
			mode = "topline",
		})

		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt" },
			enable_check_bracket_line = false,
			check_ts = true,
		})

		require("Comment").setup({
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
	end,
}
