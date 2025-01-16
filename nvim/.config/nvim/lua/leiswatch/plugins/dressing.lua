return {
	"stevearc/dressing.nvim",
	enabled = false,
	opts = {
		input = {
			enabled = true,
			border = "rounded",
			title_pos = "center",
			win_options = {
				winblend = 0,
			},
			mappings = {
				n = {
					["<Esc>"] = "Close",
					["<CR>"] = "Confirm",
				},
				i = {
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
					["<C-p>"] = "HistoryPrev",
					["<C-n>"] = "HistoryNext",
				},
			},
			get_config = function()
				if vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "neo-tree" then
					return { enabled = false }
				end
			end,
		},
		select = {
			enabled = true,
			backend = { "builtin", "fzf_lua", "nui" },
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
				width = 0.5,

				-- Set to `false` to disable
				mappings = {
					["q"] = "Close",
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
					["<C-n>"] = "",
					["<C-p>"] = "",
				},
			},
		},
	},
}
