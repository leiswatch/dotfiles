local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gt", '<CMD>BlameToggle<CR>', opts)
