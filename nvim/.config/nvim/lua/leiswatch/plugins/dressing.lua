return {
	"stevearc/dressing.nvim",
	opts = {
		input = {
			enabled = true,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			get_config = function()
				if vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "neo-tree" then
					return { enabled = false }
				end
			end,
		},
		select = {
			enabled = true,
			backend = { "builtin" },
			builtin = {
				-- These are passed to nvim_open_win
				-- anchor = "NW",
				border = "rounded",
				-- 'editor' and 'win' will default to being centered
				relative = "cursor",

				buf_options = {},
				win_options = {
					-- Window transparency (0-100)
					winblend = 0,
				},

				-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				-- the min_ and max_ options can be a list of mixed types.
				-- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
				width = nil,
				max_width = { 140, 0.8 },
				min_width = { 40, 0.2 },
				height = nil,
				max_height = 0.9,
				min_height = { 10, 0.2 },

				-- Set to `false` to disable
				mappings = {
					["q"] = "Close",
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
				},
			},
		},
	},
}
