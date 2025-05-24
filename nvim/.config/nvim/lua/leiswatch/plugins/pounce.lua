return {
	"rlane/pounce.nvim",
	lazy = true,
	keys = {
		{
			"<leader>sp",
			function()
				require("pounce").pounce()
			end,
			{ noremap = true, silent = true },
		},
	},
	opts = {},
}
