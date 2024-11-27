local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>o", function()
	vim.cmd({ cmd = "Oil", args = { "--float" } })
end, opts)
-- vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", opts)
