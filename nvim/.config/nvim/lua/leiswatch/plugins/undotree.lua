return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true } },
	},
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_SplitWidth = 50
		vim.g.undotree_DiffAutoOpen = 0
	end,
}
