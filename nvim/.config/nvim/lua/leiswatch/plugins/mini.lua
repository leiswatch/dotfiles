return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.bufremove").setup()
		require("mini.ai").setup({
			custom_textobjects = {
				f = false,
				c = false,
			},
		})
	end,
}
