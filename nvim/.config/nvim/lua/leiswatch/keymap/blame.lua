local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gt", ':BlameToggle<CR>', opts)
