local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle focus=true<CR>", opts)
vim.keymap.set("n", "<leader>xl", ":Trouble loclist toggle focus=true<CR>", opts)
vim.keymap.set("n", "<leader>xq", ":Trouble qflist toggle focus=true<CR>", opts)
vim.keymap.set("n", "gR", ":Trouble lsp_references toggle focus=true<CR>", opts)
