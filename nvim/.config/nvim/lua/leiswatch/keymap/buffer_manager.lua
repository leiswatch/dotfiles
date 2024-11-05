local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-k>", require("buffer_manager.ui").nav_prev, opts)
vim.keymap.set("n", "<A-j>", require("buffer_manager.ui").nav_next, opts)
-- vim.keymap.set("n", "<leader>j", require("buffer_manager.ui").toggle_quick_menu, opts)
