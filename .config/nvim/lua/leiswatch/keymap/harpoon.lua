local harpoon = require("harpoon")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>m", function()
	harpoon:list():add()
end, opts)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {
		title_pos = "center",
		border = "single",
		ui_max_width = vim.api.nvim_win_get_width(0) - 75,
	})
end, opts)
vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end, opts)
vim.keymap.set("n", "<C-j>", function()
	harpoon:list():select(2)
end, opts)
vim.keymap.set("n", "<C-k>", function()
	harpoon:list():select(3)
end, opts)
vim.keymap.set("n", "<C-l>", function()
	harpoon:list():select(4)
end, opts)

vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
