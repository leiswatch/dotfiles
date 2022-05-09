require("nvim-tree").setup({
	disable_netrw = true,
	update_cwd = true,
	view = {
		width = 60,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
	},
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = true,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	hijack_directories = {
		enable = false,
		auto_open = false,
	},
})
