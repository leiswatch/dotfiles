local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle focus=true<CR>", helpers.keymap_opts)
vim.keymap.set("n", "<leader>xl", ":Trouble loclist toggle focus=true<CR>", helpers.keymap_opts)
vim.keymap.set("n", "<leader>xq", ":Trouble qflist toggle focus=true<CR>", helpers.keymap_opts)
vim.keymap.set("n", "gR", ":Trouble lsp_references toggle focus=true<CR>", helpers.keymap_opts)
