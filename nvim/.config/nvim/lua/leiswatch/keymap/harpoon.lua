local harpoon = require("harpoon")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>m", function()
	harpoon:list():add()
end, opts)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {
		title_pos = "center",
		border = "rounded",
	})
end, opts)
vim.keymap.set("n", "<C-1>", function()
	harpoon:list():select(1)
end, opts)
vim.keymap.set("n", "<C-2>", function()
	harpoon:list():select(2)
end, opts)
vim.keymap.set("n", "<C-3>", function()
	harpoon:list():select(3)
end, opts)
vim.keymap.set("n", "<C-4>", function()
	harpoon:list():select(4)
end, opts)

vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
