local colors = require("catppuccin.palettes").get_palette("mocha")

local cattpuccin_mocha = {
	normal = {
		a = { fg = colors.crust, bg = colors.blue },
		b = { fg = colors.mauve, bg = colors.surface0 },
		z = { fg = colors.crust, bg = colors.yellow },
		c = { fg = colors.text, bg = colors.crust },
		x = { fg = colors.text, bg = colors.crust },
		y = { fg = colors.text, bg = colors.crust },
	},
	insert = { a = { fg = colors.crust, bg = colors.red } },
	visual = { a = { fg = colors.crust, bg = colors.mauve } },
	replace = { a = { fg = colors.crust, bg = colors.blue } },
	inactive = {
		a = { fg = colors.text, bg = colors.crust },
		b = { fg = colors.text, bg = colors.crust },
		c = { fg = colors.crust, bg = colors.black },
	},
}

local config = {
	options = {
		icons_enabled = true,
		theme = cattpuccin_mocha,
		globalstatus = true,
		component_separators = "",
		section_separators = "",
        -- section_separators = { left = '', right = ''},
		-- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },

		disabled_filetypes = { -- Filetypes to disable lualine for.
			statusline = {}, -- only ignores the ft for statusline.
			winbar = {}, -- only ignores the ft for winbar.
		},
	},
	sections = {
		lualine_a = {
			{ "mode", icons_enabled = true, icon = "" },
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
					modified = " ",
					added = " ",
					removed = " ",
				},
			},
		},
		lualine_c = {
			"%=",
			{ colored = true, icon_only = true, "filetype" },
			{ "filename", padding = { left = 0 } },
		},
		lualine_x = {
			"diagnostics",
		},
		lualine_y = {
			"searchcount",
			{
				"fileformat",
				icons_enabled = true,
			},
			{
				"encoding",
				fmt = function(str)
					return string.upper(str)
				end,
				color = { fg = colors.red, bg = colors.crust },
			},
			"progress",
		},
		lualine_z = { "location" },
	},
	extensions = { "neo-tree", "quickfix", "fzf" },
}

require("lualine").setup(config)
