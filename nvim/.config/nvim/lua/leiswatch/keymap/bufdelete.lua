local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>w", "<cmd>Bdelete<CR>", opts)
vim.keymap.set("n", "<leader>bd", function()
	MiniBufremove.delete()
end, opts)
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, opts)
vim.keymap.set("n", "<leader>bp", vim.cmd.bprev, opts)
