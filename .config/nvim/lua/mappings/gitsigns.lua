local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)
