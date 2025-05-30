return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		indent = {
			enabled = true,
			scope = { enabled = false },
			indent = {
				only_current = true,
				char = "╎",
			},
			animate = { enabled = false },
			chunk = { enabled = false },
		},
		bigfile = { enabled = true },
		dashboard = {
			row = 4,
			enabled = true,
			preset = {
				pick = "fzf-lua",
				keys = {
					{ icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":FzfLua live_grep ",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ':lua require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })',
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{
						icon = " ",
						key = "m",
						desc = "Mason",
						action = ":Mason",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		gitbrowse = {
			url_patterns = {
				["bitbucket%.org"] = {
					branch = "/src/{branch}",
					file = "/src/{branch}/{file}#lines-{line_start}:{line_end}",
					permalink = "/src/{commit}/{file}#lines-{line_start}:{line_end}",
					commit = "/commits/{commit}",
				},
			},
		},
		statuscolumn = { enabled = true },
		input = {
			enabled = true,
			icon = "",
		},
		lazygit = { configure = false },
		picker = {
			enabled = true,
			ui_select = true,
			preview = false,
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
				list = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
			},
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
				keys = {
					n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
					i_esc = { "<esc>", { "cmp_close", "stopinsert", "cancel" }, mode = "i", expr = true },
				},
			},

			lazygit = {
				-- border = "single",
				width = 0,
				height = 0,
				zindex = 250,
			},
		},
	},
}
