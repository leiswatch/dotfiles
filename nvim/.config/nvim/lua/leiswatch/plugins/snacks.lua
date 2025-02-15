return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		indent = {
			enabled = true,
			scope = { enabled = false },
			indent = {
				only_current = false,
				-- char = "╎",
			},
			animate = { enabled = false },
		},
		bigfile = { enabled = true },
		dashboard = {
			row = 4,
			enabled = true,
			preset = {
				pick = "fzf-lua",
				keys = {
					{ icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		statuscolumn = { enabled = true },
		input = { enabled = true, icon = "" },
		lazygit = { configure = false },
		picker = {
			enabled = true,
			ui_select = true,
			preview = false,
			layouts = {
				select = {
					preview = false,
					layout = {
						backdrop = false,
						width = 0.5,
						min_width = 80,
						height = 0.4,
						min_height = 3,
						box = "vertical",
						border = "single",
						title = "{title}",
						title_pos = "center",
						relative = "cursor",
						row = 1,
						{ win = "input", height = 1, border = "bottom" },
						{ win = "list", border = "none" },
					},
				},
			},
		},

		styles = {
			input = {
				relative = "cursor",
				row = -3,
				col = 0,
				border = "single",
				wo = {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,FloatTitle:FloatTitle",
					cursorline = false,
				},
			},

			lazygit = {
				width = 0,
				height = 0.99,
			},
		},
	},
}
