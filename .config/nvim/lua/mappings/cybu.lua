local opts = { noremap = true, silent = true }

vim.keymap.set("n", "H", "<Plug>(CybuPrev)", opts)
vim.keymap.set("n", "L", "<Plug>(CybuNext)", opts)
