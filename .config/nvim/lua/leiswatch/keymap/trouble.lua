local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>xx", "<CMD>TroubleToggle<CR>", opts)
vim.keymap.set("n", "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>xd", "<CMD>Trouble document_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>xl", "<CMD>Trouble loclist<CR>", opts)
vim.keymap.set("n", "<leader>xq", "<CMD>Trouble quickfix<CR>", opts)
vim.keymap.set("n", "gR", "<CMD>Trouble lsp_references<CR>", opts)
