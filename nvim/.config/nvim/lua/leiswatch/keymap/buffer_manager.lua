local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-k>", '<cmd>:lua require("buffer_manager.ui").nav_prev()<CR>', opts)
vim.keymap.set("n", "<A-j>", '<cmd>:lua require("buffer_manager.ui").nav_next()<CR>', opts)
-- vim.keymap.set("n", "<leader>j", require("buffer_manager.ui").toggle_quick_menu, opts)
