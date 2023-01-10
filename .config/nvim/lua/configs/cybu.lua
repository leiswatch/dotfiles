require("cybu").setup({
	position = {
		anchor = "center",
		max_win_width = 0.5,
    max_win_height = 15,
	},
	style = {
		border = "rounded",
		path = "relative",
		path_abbreviation = "none", -- none, shortened
		hide_buffer_id = true,
		padding = 2,
	},
	behavior = { -- set behavior for different modes
		mode = {
			default = {
				switch = "immediate", -- immediate, on_close
				view = "paging", -- paging, rolling
			},
			last_used = {
				switch = "on_close", -- immediate, on_close
				view = "paging", -- paging, rolling
			},
			auto = {
				view = "paging", -- paging, rolling
			},
		},
	},
})
