return {
	"romgrk/barbar.nvim",
	enabled = false,
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
		animation = false,
		separator_at_end = false,
		separator = { left = "", right = "" },
		semantic_letters = false,
		auto_hide = 1,
		sidebar_filetypes = {
			undotree = true,
			-- Or, specify the event which the sidebar executes when leaving:
			-- ["neo-tree"] = true,
			["neo-tree"] = { event = "BufWipeout" },
		},
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
