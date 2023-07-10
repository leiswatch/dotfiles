local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)
