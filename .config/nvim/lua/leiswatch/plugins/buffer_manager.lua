return {
	"j-morano/buffer_manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		short_file_names = false,
		short_term_names = true,
		width = 0.7,
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		highlight = "Normal:FloatBorder",
		win_extra_options = {
			relativenumber = false,
		},
	},
}
