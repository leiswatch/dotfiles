local opts = { noremap = true, silent = true }

vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>", opts)
vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>", opts)
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineMoveNext<cr>", opts)
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineMovePrev<cr>", opts)
