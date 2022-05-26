vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = "%r"

local git_blame = require("gitblame")

-- stylua: ignore
local colors_catppuccin = {
	blue   = '#96CDFB',
	cyan   = '#ABE9B3',
	black  = '#1E1E2E',
	white  = '#D9E0EE',
	red    = '#F28FAD',
	violet = '#DDB6F2',
	grey   = '#302D41',
}

local bubbles_theme_catppuccin = {
	normal = {
		a = { fg = colors_catppuccin.black, bg = colors_catppuccin.violet },
		b = { fg = colors_catppuccin.white, bg = colors_catppuccin.grey },
		c = { fg = colors_catppuccin.black, bg = colors_catppuccin.black },
		x = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
	},

	insert = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.blue } },
	visual = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.cyan } },
	replace = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.red } },

	inactive = {
		a = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
		b = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
		c = { fg = colors_catppuccin.black, bg = colors_catppuccin.black },
	},
}

require("lualine").setup({
	options = {
		theme = bubbles_theme_catppuccin,
		globalstatus = true,
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
		lualine_y = { "filetype", "progress", "encoding" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
})
