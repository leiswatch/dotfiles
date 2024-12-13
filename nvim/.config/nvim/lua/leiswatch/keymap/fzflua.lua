local opts = { noremap = true, silent = true }

local fzf = require("fzf-lua")

vim.keymap.set("n", "<C-p>", fzf.files, opts)
vim.keymap.set("n", "<leader>ff", fzf.files, opts)
vim.keymap.set("n", "<leader>fg", fzf.grep, opts)
vim.keymap.set("n", "<leader>fl", function()
	fzf.live_grep({
		cmd = "rg --column --line-number --sort=path --no-heading --color=always --fixed-strings --ignore-case --hidden --max-columns=4096 --trim -e",
		exec_empty_query = false,
	})
end, opts)
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, opts)
vim.keymap.set("v", "<leader>fw", fzf.grep_visual, opts)
vim.keymap.set("n", "<leader>fk", fzf.git_branches, opts)

-- vim.keymap.set("n", "<leader>j", function()
-- 	require("fzf-lua").buffers({
-- 		winopts = {
-- 			row = 0.5,
-- 			col = 0.5,
-- 			height = 0.4,
-- 			width = 0.4,
-- 			preview = { hidden = "hidden" },
-- 		},
-- 	})
-- end, opts)
