local catppuccin = require("catppuccin")
--[[ local ucolors = require("catppuccin.utils.colors") ]]
--[[ local macchiato = require("catppuccin.palettes").get_palette("macchiato") ]]

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	flavour = "mocha",
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	custom_highlights = {
		DiagnosticVirtualTextError = { bg = "NONE" },
		DiagnosticVirtualTextWarn = { bg = "NONE" },
		DiagnosticVirtualTextInfo = { bg = "NONE" },
		DiagnosticVirtualTextHint = { bg = "NONE" },
	},
	integrations = {
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
		bufferline = true,
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
		lsp_saga = true,
		treesitter_context = false,
		which_key = true,
		dashboard = true,
		neogit = true,
	},
})
