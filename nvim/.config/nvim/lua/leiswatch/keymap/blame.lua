local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gt", vim.cmd.BlameToggle, opts)
