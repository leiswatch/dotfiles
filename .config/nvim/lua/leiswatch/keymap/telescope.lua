local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }

local project_files = function()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		builtin.git_files(opts)
	else
		builtin.find_files(opts)
	end
end

vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fw", builtin.grep_string, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>tf", project_files, opts)
vim.keymap.set("n", "<leader>fj", "<CMD>Telescope harpoon marks<CR>", opts)

-- vim.keymap.set("n", "<C-p>", "<CMD>FzfLua files<CR>", opts)
-- vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", opts)
-- vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", opts)
-- vim.keymap.set("n", "<leader>fw", "<CMD>FzfLua grep_cword<CR>", opts)
-- vim.keymap.set("v", "<leader>fv", "<CMD>FzfLua grep_visual<CR>", opts)
