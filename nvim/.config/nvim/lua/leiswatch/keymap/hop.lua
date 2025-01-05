local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>tp", vim.cmd.HopPattern, helpers.keymap_opts)
vim.keymap.set("n", "<leader>tw", vim.cmd.HopWord, helpers.keymap_opts)
