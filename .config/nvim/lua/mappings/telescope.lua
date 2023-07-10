local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }

local project_files = function()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		require("telescope.builtin").git_files(opts)
	else
		require("telescope.builtin").find_files(opts)
	end
end

vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
vim.keymap.set("n", "<leader>tg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>tb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>th", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>tf", project_files, opts)
vim.keymap.set("n", "<leader>tj", "<cmd>Telescope harpoon marks<cr>", opts)
