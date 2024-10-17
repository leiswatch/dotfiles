local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gt", '<cmd>BlameToggle<CR>', opts)
