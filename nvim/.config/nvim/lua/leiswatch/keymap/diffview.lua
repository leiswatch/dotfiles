local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>dfo", "<cmd>DiffviewOpen<cr>", opts)
vim.keymap.set("n", "<leader>dfc", "<cmd>DiffviewClose<cr>", opts)
