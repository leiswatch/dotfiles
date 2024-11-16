return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{
			"<leader>gs",
			"<cmd>GrugFar<cr>",
		},
	},
	config = function()
		require("grug-far").setup({
			windowCreationCommand = "tab split",
			startInInsertMode = false,
		})
	end,
}
