return {
	"rose-pine/neovim",
	name = "rose-pine",
    enabled = false,
	config = function()
		require("rose-pine").setup({
			variant = "auto", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = false,

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
