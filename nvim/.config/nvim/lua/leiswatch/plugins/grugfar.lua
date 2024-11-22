return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{
			"<leader>go",
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
