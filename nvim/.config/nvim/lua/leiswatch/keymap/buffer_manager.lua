local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<A-k>", require("buffer_manager.ui").nav_prev, helpers.keymap_opts)
vim.keymap.set("n", "<A-j>", require("buffer_manager.ui").nav_next, helpers.keymap_opts)
-- vim.keymap.set("n", "J", require("buffer_manager.ui").toggle_quick_menu, helpers.keymap_opts)
