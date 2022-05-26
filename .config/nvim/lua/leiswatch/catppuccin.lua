local catppuccin = require("catppuccin")

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	styles = {
		comments = "NONE",
		conditionals = "NONE",
		loops = "NONE",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},
	integrations = {
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "undercurl",
				hints = "undercurl",
				warnings = "undercurl",
				information = "undercurl",
			},
		},
		treesitter = true,
		barbar = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = true,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		ts_rainbow = true,
		lsp_trouble = true,
		cmp = true,
		gitgutter = true,
		gitsigns = true,
	},
})
