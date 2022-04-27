vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = "%c"

local git_blame = require("gitblame")

require("lualine").setup({
	options = {
		theme = "vscode",
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		--     lualine_c = {
		--       { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
		--     },
		lualine_x = {
			{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})
