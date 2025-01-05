local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, helpers.keymap_opts)
