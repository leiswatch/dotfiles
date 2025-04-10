return {
	"echasnovski/mini.nvim",
	version = false,
	event = { "BufReadPost" },
	config = function()
		require("mini.ai").setup({
			custom_textobjects = {
				f = false,
				c = false,
			},
		})

		require("mini.jump").setup({
			delay = {
				-- Delay between jump and highlighting all possible jumps
				highlight = 50,
				-- Delay between jump and automatic stop if idle (no jump is done)
				idle_stop = 10000000,
			},
			silent = true,
		})
	end,
}
