local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>w", "<cmd>Bdelete<CR>", opts)
vim.keymap.set("n", "tw", ":Bdelete<CR>", opts)
vim.keymap.set("n", "tn", ":bnext<CR>", opts)
vim.keymap.set("n", "tp", ":bprev<CR>", opts)
