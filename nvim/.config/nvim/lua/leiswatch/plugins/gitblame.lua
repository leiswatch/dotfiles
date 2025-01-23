return {
	"FabijanZulj/blame.nvim",
	keys = {
		{ "<leader>gt", vim.cmd.BlameToggle, { noremap = true, silent = true } },
	},
	event = { "BufRead" },
	config = true,
}
