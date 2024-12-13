local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fl", builtin.live_grep, opts)
vim.keymap.set({ "n", "v" }, "<leader>fw", builtin.grep_string, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fj", ":Telescope harpoon marks<CR>", opts)
