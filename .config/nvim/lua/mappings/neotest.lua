local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>nr", ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>', opts)
vim.keymap.set("n", "<leader>ns", ':lua require("neotest").summary.toggle()<cr>', opts)
