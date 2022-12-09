require("nvim-tree").setup({
	disable_netrw = true,
	ignore_buffer_on_setup = true,
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
			quit_on_open = true,
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
		enable = true,
		auto_open = true,
	},
	log = {
		enable = false,
	},
	filters = {
		dotfiles = true,
	},
})
