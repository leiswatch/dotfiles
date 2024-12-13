local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>tp", vim.cmd.HopPattern, opts)
vim.keymap.set("n", "<leader>tw", vim.cmd.HopWord, opts)
