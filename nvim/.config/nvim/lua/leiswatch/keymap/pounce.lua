local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>h", require("pounce").pounce, opts)
