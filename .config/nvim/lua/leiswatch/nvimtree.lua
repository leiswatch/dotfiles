require("nvim-tree").setup({
	disable_netrw = true,
	update_cwd = true,
	view = {
		width = 50,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		hide_root_folder = true,
	},
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
				},
			},
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
	log = {
		enable = false,
	},
	filters = {
		dotfiles = true,
	},
})
