return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{
			"<leader>go",
			vim.cmd.GrugFar,
			{ noremap = true, silent = true },
		},
	},
	config = function()
		require("grug-far").setup({
			windowCreationCommand = "tab split",
			startInInsertMode = false,
		})
	end,
}
