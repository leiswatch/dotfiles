return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<space>ff", "  Find files", ":FzfLua files<CR>"),
			dashboard.button("<space>fl", "󰱼  Search", ":FzfLua live_grep<CR>"),
			dashboard.button("<space>fh", "󰋗  Help", ":FzfLua helptags<CR>"),
			dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)
	end,
}
