return {
	"nvim-lualine/lualine.nvim",
	event = { "BufEnter" },
	opts = function()
		-- local mocha_colors = require("catppuccin.palettes").get_palette("mocha")

		-- local catppuccin = {
		-- 	normal = {
		-- 		a = { fg = mocha_colors.crust, bg = mocha_colors.blue },
		-- 		b = { fg = mocha_colors.mauve, bg = mocha_colors.crust },
		-- 		z = { fg = mocha_colors.crust, bg = mocha_colors.lavender },
		-- 		c = { fg = mocha_colors.text, bg = mocha_colors.crust },
		-- 		x = { fg = mocha_colors.text, bg = mocha_colors.crust },
		-- 		y = { fg = mocha_colors.teal, bg = mocha_colors.crust },
		-- 	},
		-- 	insert = {
		-- 		a = { fg = mocha_colors.crust, bg = mocha_colors.green },
		-- 		z = { fg = mocha_colors.crust, bg = mocha_colors.lavender },
		-- 	},
		-- 	visual = { a = { fg = mocha_colors.crust, bg = mocha_colors.mauve } },
		-- 	replace = { a = { fg = mocha_colors.crust, bg = mocha_colors.blue } },
		-- 	inactive = {
		-- 		a = { fg = mocha_colors.text, bg = mocha_colors.crust },
		-- 		b = { fg = mocha_colors.text, bg = mocha_colors.crust },
		-- 		c = { fg = mocha_colors.crust, bg = mocha_colors.black },
		-- 	},
		-- }

		local tokyonight_colors = require("tokyonight.colors").setup()
		local tokyonight = {
			normal = {
				a = { fg = tokyonight_colors.bg_dark, bg = tokyonight_colors.blue },
				b = { fg = tokyonight_colors.purple, bg = tokyonight_colors.bg_dark },
				c = { fg = tokyonight_colors.fg, bg = tokyonight_colors.bg_dark },
				x = { fg = tokyonight_colors.fg, bg = tokyonight_colors.bg_dark },
				y = { fg = tokyonight_colors.teal, bg = tokyonight_colors.bg_dark },
				z = { fg = tokyonight_colors.fg, bg = tokyonight_colors.bg_highlight },
			},
			insert = {
				a = { fg = tokyonight_colors.bg_dark, bg = tokyonight_colors.green },
				z = { fg = tokyonight_colors.bg_dark, bg = tokyonight_colors.blue },
			},
			visual = { a = { fg = tokyonight_colors.bg_dark, bg = tokyonight_colors.purple } },
			replace = { a = { fg = tokyonight_colors.bg_dark, bg = tokyonight_colors.blue } },
			inactive = {
				a = { fg = tokyonight_colors.fg, bg = tokyonight_colors.bg_dark },
				b = { fg = tokyonight_colors.fg, bg = tokyonight_colors.bg_dark },
				c = { fg = tokyonight_colors.bg_dark, bg = tokyonight_colors.black },
			},
		}

		return {
			options = {
				theme = tokyonight,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(s)
							return s:sub(1, 1) .. s:sub(2):lower()
						end,
						icons_enabled = true,
						icon = "",
					},
				},
				lualine_b = {
					{ "branch", icon = " 󰘬", colored = true },
					{
						"diff",
						diff_color = {
							-- added = { fg = mocha_colors.green },
							-- modified = { fg = mocha_colors.yellow },
							-- removed = { fg = mocha_colors.red },
							added = { fg = tokyonight_colors.green },
							modified = { fg = tokyonight_colors.warning },
							removed = { fg = tokyonight_colors.error },
						},
						symbols = {
							modified = " ",
							added = " ",
							removed = " ",
						},
					},
				},
				lualine_c = {
					"%=",
					{ colored = true, icon_only = true, "filetype", padding = { right = 0 } },
					{ "filename", padding = { left = 0 } },
				},
				lualine_x = {
					{
						"searchcount",
						icons_enabled = true,
						icon = "",
						-- color = { fg = mocha_colors.peach },
						color = { fg = tokyonight_colors.orange },
					},
					"diagnostics",
					{
						"encoding",
						-- color = { fg = mocha_colors.sapphire },
						color = { fg = tokyonight_colors.teal },
					},
					{
						"fileformat",
						icons_enabled = true,
						colored = true,
						symbols = {
							unix = "LF",
							dos = "CRLF",
							mac = "CR",
						},
						padding = { right = 0 },
						color = { fg = tokyonight_colors.red },
					},
					{
						"progress",
						fmt = function()
							local current_line = vim.fn.line(".")
							local total_lines = vim.fn.line("$")
							local chars =
								{ "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
							local line_ratio = current_line / total_lines
							local index = math.ceil(line_ratio * #chars)
							return chars[index]
						end,
						padding = { left = 1, right = 1 },
						color = { fg = tokyonight_colors.cyan },
					},
				},
				lualine_y = {},
				lualine_z = {
					"location",
				},
			},
			extensions = { "neo-tree", "quickfix", "fzf" },
		}
	end,
}
