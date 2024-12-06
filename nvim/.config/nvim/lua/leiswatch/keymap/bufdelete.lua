local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>w", "<cmd>Bdelete<CR>", opts)
vim.keymap.set("n", "<leader>bd", function()
	MiniBufremove.delete()
end, opts)
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", opts)
