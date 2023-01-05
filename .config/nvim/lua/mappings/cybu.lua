local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-k>", "<Plug>(CybuPrev)", opts)
vim.keymap.set("n", "<A-j>", "<Plug>(CybuNext)", opts)
