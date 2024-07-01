local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>dfo", '<CMD>DiffviewOpen<CR>', opts)
vim.keymap.set("n", "<leader>dfc", '<CMD>DiffviewClose<CR>', opts)
