local helpers = require("leiswatch.helpers")

vim.keymap.set({ "n", "v" }, "<leader>gu", Snacks.gitbrowse.open, helpers.keymap_opts)
vim.keymap.set("n", "<leader>lg", Snacks.lazygit.open, helpers.keymap_opts)
