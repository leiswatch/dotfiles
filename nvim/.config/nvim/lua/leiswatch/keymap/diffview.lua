local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>dfo", vim.cmd.DiffviewOpen, opts)
vim.keymap.set("n", "<leader>dfc", vim.cmd.DiffviewClose, opts)
