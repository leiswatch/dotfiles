local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<leader>o", function()
	vim.cmd({ cmd = "Oil", args = { "--float" } })
end, helpers.keymap_opts)
-- vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", helpers.keymap_opts)
