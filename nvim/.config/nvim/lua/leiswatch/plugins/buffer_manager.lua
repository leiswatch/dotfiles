return {
	"leiswatch/buffer_manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"J",
			function()
				require("buffer_manager.ui").toggle_quick_menu()
			end,
			{ noremap = true, silent = true },
		},
	},
	opts = {
		short_file_names = false,
		short_term_names = true,
		width = 0.75,
		height = 10,
		border = "single",
		highlight = "Normal:FloatBorder",
		win_extra_options = {
			-- border = "single",
			-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			relativenumber = false,
		},
	},
}
