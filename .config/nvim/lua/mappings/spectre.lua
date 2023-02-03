local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opts)
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
vim.keymap.set("v", "<leader>s", "<esc>:lua require('spectre').open_visual()<CR>", opts)
