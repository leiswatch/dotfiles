local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

dashboard.section.buttons.val = {
	dashboard.button("n", "󰈔  New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󰈞  Find Text", ":Telescope live_grep <CR>"),
	dashboard.button("q", "  Exit", ":q<CR>"),
}

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		-- local version = "󰥱 v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
		local plugins = "  Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
		local footer = plugins .. "\n"
		dashboard.section.footer.val = footer
		pcall(vim.cmd.AlphaRedraw)
	end,
})
