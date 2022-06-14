require("cybu").setup({
	position = {
		max_win_height = 20,
		anchor = "bottomright",
		max_win_width = 0.3,
	},
	style = {
		path = "tail",
		border = "rounded",
		padding = 2,
		hide_buffer_id = true,
	},
	display_time = 500,
	exclude = {
		"NvimTree",
		"lspinfo",
	},
})
