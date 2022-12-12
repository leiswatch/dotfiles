local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>", opts)
