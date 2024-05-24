return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")

		local cattpuccin_mocha = {
			normal = {
				a = { fg = colors.crust, bg = colors.blue },
				b = { fg = colors.mauve, bg = colors.surface0 },
				z = { fg = colors.crust, bg = colors.lavender },
				c = { fg = colors.text, bg = colors.crust },
				x = { fg = colors.text, bg = colors.crust },
				y = { fg = colors.teal, bg = colors.crust },
			},
			insert = {
				a = { fg = colors.crust, bg = colors.green },
				z = { fg = colors.crust, bg = colors.lavender },
			},
			visual = { a = { fg = colors.crust, bg = colors.mauve } },
			replace = { a = { fg = colors.crust, bg = colors.blue } },
			inactive = {
				a = { fg = colors.text, bg = colors.crust },
				b = { fg = colors.text, bg = colors.crust },
				c = { fg = colors.crust, bg = colors.black },
			},
		}

		require("lualine").setup({
			options = {
				theme = cattpuccin_mocha,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
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
					{ "branch", icon = "󰘬", colored = true },
					{
						"diff",
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.yellow },
							removed = { fg = colors.red },
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
						color = { fg = colors.peach },
					},
					"diagnostics",
					{
						"encoding",
						color = { fg = colors.sapphire },
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
						-- color = { fg = colors.red },
					},
				},
				lualine_y = {
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
					},
				},
				lualine_z = {
					"location",
				},
			},
			extensions = { "neo-tree", "quickfix", "fzf" },
		})
	end,
}
