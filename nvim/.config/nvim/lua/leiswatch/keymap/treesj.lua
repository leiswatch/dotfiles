local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>tj", require("treesj").toggle, helpers.keymap_opts)
vim.keymap.set("n", "<leader>tJ", function()
	require("treesj").toggle({ split = { recursive = true } })
end, helpers.keymap_opts)
