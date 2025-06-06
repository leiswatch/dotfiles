return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "master",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
				multiline_threshold = 3,
				max_lines = 3,
				separator = nil,
				mode = "topline",
			},
		},
		{
			"windwp/nvim-ts-autotag",
			opts = {
				opts = {
					enable_close = false, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
					aliases = {
						["templ"] = "html",
					},
				},
			},
		},
		"JoosepAlviste/nvim-ts-context-commentstring",
		"numToStr/Comment.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"leafOfTree/vim-matchtag",
			init = function()
				vim.g.vim_matchtag_files = "*.html,*.xml,*.jsx,*.tsx,*.vue,*.svelte,*.jsp,*.php,*.erb,*.astro"
				vim.g.vim_matchtag_highlight_cursor_on = 1
			end,
		},
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("Comment").setup({
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"go",
				"graphql",
				"html",
				"hyprlang",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"scss",
				"templ",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"zig",
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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			textobjects = {
				select = {
					enable = true,
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true or false
					include_surrounding_whitespace = false,
				},
			},
			modules = {},
			ignore_install = {},
		})
	end,
}
