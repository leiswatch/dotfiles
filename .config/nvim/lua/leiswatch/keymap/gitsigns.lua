local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gt", "<CMD>Gitsigns toggle_current_line_blame<CR>", opts)
vim.keymap.set("n", "<leader>gs",  "<CMD>Gitsigns stage_hunk<CR>", opts)
vim.keymap.set("v", "<leader>gs",  "<CMD>Gitsigns stage_hunk<CR>", opts)
vim.keymap.set("n", "<leader>gr",  "<CMD>Gitsigns reset_hunk<CR>", opts)
vim.keymap.set("v", "<leader>gr",  "<CMD>Gitsigns reset_hunk<CR>", opts)
