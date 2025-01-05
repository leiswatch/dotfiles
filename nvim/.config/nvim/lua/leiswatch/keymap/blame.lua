local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>gt", vim.cmd.BlameToggle, helpers.keymap_opts)
