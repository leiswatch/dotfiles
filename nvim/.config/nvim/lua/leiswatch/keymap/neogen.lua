local helpers = require("leiswatch.helpers")

vim.keymap.set({ "n", "v" }, "<leader>ng", vim.cmd.Neogen, helpers.keymap_opts)
