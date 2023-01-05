local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
