local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>lg", Snacks.lazygit.open, helpers.keymap_opts)
