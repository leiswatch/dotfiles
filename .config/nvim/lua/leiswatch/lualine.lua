vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_enabled = true
vim.g.gitblame_message_template = "<author> • <date> • <summary>"
local git_blame = require("gitblame")
-- stylua: ignore
local colors_catppuccin = {
	blue   = '#87b0f9',
	cyan   = '#74c7ec',
	black  = '#1e1e2e',
	white  = '#c6d0f5',
	red    = '#f38ba8',
	violet = '#cba6f7',
	grey   = '#313244',
}

local bubbles_theme_catppuccin = {
	normal = {
		a = { fg = colors_catppuccin.black, bg = colors_catppuccin.violet },
		b = { fg = colors_catppuccin.white, bg = colors_catppuccin.grey },
		c = { fg = colors_catppuccin.black, bg = colors_catppuccin.grey },
		x = { fg = colors_catppuccin.white, bg = colors_catppuccin.grey },
	},

	insert = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.red } },
	visual = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.cyan } },
	replace = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.blue } },
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
		-- section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode" }, --[[ separator = { left = "" }, right_padding = 2 }, ]]
		},
		lualine_b = {
			"filename",
			"branch",
			"diff",
		},
		-- lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			"diagnostics",
			"filetype",
			"progress",
			"fileformat",
			"encoding",
		},
		lualine_z = {
			{ "location" }, --[[ separator = { right = "" }, left_padding = 3 }, ]]
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
