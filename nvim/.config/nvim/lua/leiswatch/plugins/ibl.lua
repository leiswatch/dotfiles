return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = false,
	event = { "BufRead" },
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
		})
	end,
}
