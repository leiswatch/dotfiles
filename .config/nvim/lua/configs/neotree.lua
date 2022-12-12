require("neo-tree").setup({
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	window = {
		position = "left",
		width = 70,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
	},
	filesystem = {
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false, -- only works on Windows for hidden files/directories
		},
		follow_current_file = true,
	},
	git_status = {
		window = {
			position = "float",
		},
	},
})
