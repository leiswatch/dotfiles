local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>dfo", vim.cmd.DiffviewOpen, helpers.keymap_opts)
vim.keymap.set("n", "<leader>dfc", vim.cmd.DiffviewClose, helpers.keymap_opts)
