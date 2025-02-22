return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{
			"<leader>go",
			function()
				require("grug-far").open()
			end,
			{ noremap = true, silent = true },
		},
	},
	opts = {
		windowCreationCommand = "vsplit",
		startInInsertMode = false,
	},
}
