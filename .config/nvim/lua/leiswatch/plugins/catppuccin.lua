return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	enabled = true,
	config = function()
		local darken = require("catppuccin.utils.colors").darken
		local darkening_percentage = 0.095

		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			term_colors = true,
			show_end_of_buffer = false,
			no_italic = false,
			no_bold = false,
			no_underline = false,
			default_integrations = false,
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
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
				miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			custom_highlights = function(color)
				return {
					FloatBorder = { fg = color.surface1, bg = "NONE" },
					FloatTitle = { fg = color.text, bg = "NONE" },
					BufferManagerNormal = { fg = color.text, bg = "NONE" },
					BufferManagerBorder = { fg = color.surface1, bg = "NONE" },
					BufferManagerFloatTitle = { fg = color.text, bg = "NONE" },
					HarpoonBorder = { fg = color.surface1, bg = "NONE" },
					NeotreeNormal = { fg = color.text, bg = "NONE" },
					Neotree = { fg = color.text, bg = "NONE" },

					TelescopeBorder = { fg = color.surface1, bg = "NONE" },
					TelescopePreviewBorder = { fg = color.surface1, bg = "NONE" },
					TelescopeResultsBorder = { fg = color.surface1, bg = "NONE" },
					TelescopePromptBorder = { fg = color.surface1, bg = "NONE" },
					TelescopePromptTitle = { fg = color.text, bg = "NONE" },
					TelescopePreviewTitle = { fg = color.text, bg = "NONE" },
					TelescopeResultsTitle = { fg = color.text, bg = "NONE" },
					TelescopePromptPrefix = { fg = color.text, bg = "NONE" },
					TelescopeSelection = { fg = color.text, bg = color.surface1 },
					TelescopeSelectionCaret = { fg = color.text, bg = color.surface1 },
					TelescopeMatching = { fg = color.blue, bg = "NONE" },

					CodeActionNormal = { fg = color.text, bg = "NONE" },
					CodeActionBorder = { fg = color.surface1, bg = "NONE" },
					CodeActionText = { fg = color.text, bg = "NONE" },
					CodeActionNumber = { fg = color.green, bg = "NONE" },
					ActionPreviewNormal = { fg = color.text, bg = "NONE" },
					ActionPreviewBorder = { fg = color.surface1, bg = "NONE" },
					ActionPreviewTitle = { fg = color.text, bg = "NONE" },
					CursorLineNr = { fg = color.flamingo, bg = "NONE" },
					LineNr = { fg = color.flamingo, bg = "NONE" },
					LineNrAbove = { fg = color.surface1, bg = "NONE" },
					LineNrBelow = { fg = color.surface1, bg = "NONE" },
					ColorColumn = { fg = "NONE", bg = color.surface0 },
					TreesitterContext = { fg = "NONE", bg = color.base },
					TreesitterContextBottom = { bg = color.base, sp = color.mantle },
					TreesitterContextLineNumberBottom = { bg = color.base, sp = color.mantle, underline = true },
					TreesitterContextLineNumber = { fg = color.flamingo, bg = color.base },
					NeoTreeIndentMarker = { bg = "NONE", fg = color.surface0 },
					Directory = { bg = "NONE", fg = color.text },
					CmpItemKindCodeium = { fg = color.sapphire },
					IncSearch = { fg = color.base, bg = color.peach },
					CurSearch = { fg = color.base, bg = color.peach },
					Search = { fg = "NONE", bg = color.surface1 },
					DiagnosticVirtualTextError = {
						bg = darken(color.red, darkening_percentage, color.base),
					},
					DiagnosticVirtualTextWarn = {
						bg = darken(color.yellow, darkening_percentage, color.base),
					},
					DiagnosticVirtualTextInfo = {
						bg = darken(color.sky, darkening_percentage, color.base),
					},
					DiagnosticVirtualTextHint = {
						bg = darken(color.teal, darkening_percentage, color.base),
					},
				}
			end,
			integrations = {
				alpha = true,
				cmp = true,
				fidget = true,
				gitsigns = true,
				harpoon = true,
				markdown = true,
				mason = true,
				neotree = true,
				neotest = true,
				notify = true,
				noice = false,
				semantic_tokens = true,
				rainbow_delimiters = true,
				telescope = {
					enabled = true,
				},
				treesitter = true,
				treesitter_context = true,
				vimwiki = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
