local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit!<cr>", opts)
vim.keymap.set("n", "dgh", "<cmd>diffget //2<cr>", opts)
vim.keymap.set("n", "dgl", "<cmd>diffget //3<cr>", opts)

vim.keymap.set('n', '<leader>co', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', '<leader>ct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', '<leader>c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', ']x', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '[x', '<Plug>(git-conflict-next-conflict)')
