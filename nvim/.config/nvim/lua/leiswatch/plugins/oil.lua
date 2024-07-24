return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = false,
		columns = {
			"icon",
		},
		keymaps_help = {
			border = "rounded",
		},
		float = {
			padding = 2,
			max_width = 150,
			max_height = 30,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},
		view_options = {
			show_hidden = true,
		},
		preview = {
			border = "rounded",
		},
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = "actions.select_vsplit",
			["<C-h>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<Esc>"] = "actions.close",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
	},
}
