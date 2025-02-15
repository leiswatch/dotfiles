local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>bd", function(bufnr)
	Snacks.bufdelete.delete(bufnr)
end, helpers.keymap_opts)
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, helpers.keymap_opts)
vim.keymap.set("n", "<leader>bp", vim.cmd.bprev, helpers.keymap_opts)
