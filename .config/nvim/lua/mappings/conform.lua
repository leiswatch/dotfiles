local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>cf", ":lua require('conform').format({ timeout_ms = 2000, lsp_fallback = nil })<cr>", opts)
