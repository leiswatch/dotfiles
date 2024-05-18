return {
	"lewis6991/gitsigns.nvim",
	opts = {
		-- signs = {
		-- add = { text = "+" },
		-- change = { text = "~" },
		-- delete = { text = "_" },
		-- topdelete = { text = "‾" },
		-- changedelete = { text = "~" },
		-- add = { text = "+" },
		-- change = { text = "│" },
		-- delete = { text = "_" },
		-- topdelete = { text = "‾" },
		-- changedelete = { text = "~" },
		-- untracked = { text = "┆" },
		-- },
		debug_mode = false,
		signcolumn = true,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 250,
			ignore_whitespace = false,
			virt_text_priority = 999,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		preview_config = {
			border = "single",
		},
	},
}
