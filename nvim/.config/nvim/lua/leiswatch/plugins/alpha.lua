return {
	"goolord/alpha-nvim",
	enabled = false,
	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
		-- local dashboard = require("alpha.themes.dashboard")

		-- dashboard.section.buttons.val = {
		-- 	dashboard.button("n", "󰈔  New File", ":ene <BAR> startinsert<CR>"),
		-- 	dashboard.button("f", "  Find File", ":FzfLua files<CR>"),
		-- 	dashboard.button("r", "  Recently used files", ":FzfLua oldfiles<CR>"),
		-- 	dashboard.button("t", "󰈞  Find Text", ":FzfLua live_grep<CR>"),
		-- 	dashboard.button("q", "  Exit", ":q<CR>"),
		-- }
	end,
}
