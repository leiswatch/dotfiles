return {
	"echasnovski/mini.nvim",
	version = false,
	event = { "BufReadPost" },
	config = function()
		-- require("mini.bufremove").setup()
		require("mini.ai").setup({
			custom_textobjects = {
				f = false,
				c = false,
			},
		})
	end,
}
