local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-k>", '<cmd>:lua require("buffer_manager.ui").nav_prev()<cr>', opts)
vim.keymap.set("n", "<A-j>", '<cmd>:lua require("buffer_manager.ui").nav_next()<cr>', opts)
vim.keymap.set("n", "<leader>j", '<cmd>:lua require("buffer_manager.ui").toggle_quick_menu()<cr>', opts)
