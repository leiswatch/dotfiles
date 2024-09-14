local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>tj", require("treesj").toggle, opts)
vim.keymap.set("n", "<leader>tJ", function()
	require("treesj").toggle({ split = { recursive = true } })
end, opts)
