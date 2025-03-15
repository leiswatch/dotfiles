return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>o",
			function()
				vim.cmd({ cmd = "Oil", args = { "--float" } })
			end,
			{ noremap = true, silent = true },
		},
	},
	opts = {
		default_file_explorer = false,
		columns = {
			"icon",
		},
		keymaps_help = {
			border = "single",
		},
		skip_confirm_for_simple_edits = true,
		win_options = {
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
			relativenumber = false,
		},
		float = {
			padding = 2,
			max_width = 150,
			max_height = 30,
			border = "single",
			win_options = {
				winblend = 0,
			},
		},
		view_options = {
			show_hidden = true,
			natural_order = false,
			-- Sort file and directory names case insensitive
			case_insensitive = false,
			sort = {
				-- sort order can be "asc" or "desc"
				-- see :help oil-columns to see which columns are sortable
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
		preview = {
			border = "single",
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
