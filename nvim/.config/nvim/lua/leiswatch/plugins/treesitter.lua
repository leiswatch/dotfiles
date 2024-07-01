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
				enable = true,
				include_match_words = true,
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

		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = true, -- Auto close on trailing </
			},
		})
	end,
}
