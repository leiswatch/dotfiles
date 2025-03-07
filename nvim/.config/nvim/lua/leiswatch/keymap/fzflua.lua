local loaded = pcall(require, "fzf-lua")

if not loaded then
	return
end

local helpers = require("leiswatch.helpers")
local fzf = require("fzf-lua")

vim.keymap.set("n", "<C-p>", fzf.files, helpers.keymap_opts)
vim.keymap.set("n", "<leader>ff", fzf.files, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fg", fzf.grep, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fp", fzf.grep_project, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fl", fzf.live_grep, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fn", fzf.live_grep_native, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fk", fzf.live_grep_glob, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, helpers.keymap_opts)
vim.keymap.set("v", "<leader>fw", fzf.grep_visual, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fb", fzf.git_branches, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fh", fzf.helptags, helpers.keymap_opts)
vim.keymap.set("n", "<leader>fc", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end, helpers.keymap_opts)
