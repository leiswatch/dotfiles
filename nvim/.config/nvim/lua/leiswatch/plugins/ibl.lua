return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = true,
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
