local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-p>", require("fzf-lua").files, opts)
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, opts)
vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").grep()
end, opts)
vim.keymap.set("n", "<leader>fl", function()
	require("fzf-lua").live_grep({
		cmd = "rg --column --line-number --sort=path --no-heading --color=always --fixed-strings --ignore-case --hidden --max-columns=4096 --trim -e",
		exec_empty_query = false,
	})
end, opts)
vim.keymap.set("n", "<leader>fw", function()
	require("fzf-lua").grep_cword()
end, opts)
vim.keymap.set("v", "<leader>fw", function()
	require("fzf-lua").grep_visual()
end, opts)
