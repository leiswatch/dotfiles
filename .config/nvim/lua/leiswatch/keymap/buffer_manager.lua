local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-k>", '<CMD>:lua require("buffer_manager.ui").nav_prev()<CR>', opts)
vim.keymap.set("n", "<A-j>", '<CMD>:lua require("buffer_manager.ui").nav_next()<CR>', opts)
vim.keymap.set("n", "<leader>j", '<CMD>:lua require("buffer_manager.ui").toggle_quick_menu()<CR>', opts)
