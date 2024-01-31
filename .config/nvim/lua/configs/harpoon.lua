local harpoon = require("harpoon")

harpoon:setup({
	settings = {
		save_on_toggle = true,
        sync_on_ui_close = true,
	},
})
-- require("harpoon").setup({
-- 	menu = {
-- 		width = vim.api.nvim_win_get_width(0) - 75,
-- 		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
-- 		-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
-- 	},
-- })
