local helpers = require("leiswatch.helpers")
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>m", function()
	harpoon:list():add()
end, helpers.keymap_opts)
vim.keymap.set("n", "H", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {
		title_pos = "center",
		border = "rounded",
		ui_width_ratio = 0.75,
		height_in_lines = 10,
	})
end, helpers.keymap_opts)
vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end, helpers.keymap_opts)
vim.keymap.set("n", "<C-j>", function()
	harpoon:list():select(2)
end, helpers.keymap_opts)
vim.keymap.set("n", "<C-k>", function()
	harpoon:list():select(3)
end, helpers.keymap_opts)
vim.keymap.set("n", "<C-l>", function()
	harpoon:list():select(4)
end, helpers.keymap_opts)

vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end, helpers.keymap_opts)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end, helpers.keymap_opts)
