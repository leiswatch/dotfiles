local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)
vim.keymap.set("n", "<leader>gs",  "<cmd>Gitsigns stage_hunk<cr>", opts)
vim.keymap.set("v", "<leader>gs",  "<cmd>Gitsigns stage_hunk<cr>", opts)
vim.keymap.set("n", "<leader>gr",  "<cmd>Gitsigns reset_hunk<cr>", opts)
vim.keymap.set("v", "<leader>gr",  "<cmd>Gitsigns reset_hunk<cr>", opts)
