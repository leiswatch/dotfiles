local opts = { noremap = true, silent = true }

local fzf = require("fzf-lua")

vim.keymap.set("n", "<C-p>", fzf.files, opts)
vim.keymap.set("n", "<leader>ff", fzf.files, opts)
vim.keymap.set("n", "<leader>fg", fzf.grep, opts)
vim.keymap.set("n", "<leader>fp", fzf.grep_project, opts)
vim.keymap.set("n", "<leader>fl", fzf.live_grep, opts)
vim.keymap.set("n", "<leader>fn", fzf.live_grep_native, opts)
vim.keymap.set("n", "<leader>fk", fzf.live_grep_glob, opts)
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, opts)
vim.keymap.set("v", "<leader>fw", fzf.grep_visual, opts)
vim.keymap.set("n", "<leader>fb", fzf.git_branches, opts)
vim.keymap.set("n", "<leader>fh", fzf.helptags, opts)
vim.keymap.set("n", "<leader>fc", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end, opts)
