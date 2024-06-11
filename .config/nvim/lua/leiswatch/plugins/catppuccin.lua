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
				comments = {}, -- Change the style of comments
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
					FloatBorder = { fg = color.surface1, bg = color.none },
					FloatTitle = { fg = color.text, bg = color.none },
					BufferManagerNormal = { fg = color.text, bg = color.none },
					BufferManagerBorder = { fg = color.surface1, bg = color.none },
					BufferManagerFloatTitle = { fg = color.text, bg = color.none },
					HarpoonBorder = { fg = color.surface1, bg = color.none },
					NeotreeNormal = { fg = color.text, bg = color.none },
					Neotree = { fg = color.text, bg = color.none },

					TelescopeBorder = { fg = color.surface1, bg = color.none },
					TelescopePreviewBorder = { fg = color.surface1, bg = color.none },
					TelescopeResultsBorder = { fg = color.surface1, bg = color.none },
					TelescopePromptBorder = { fg = color.surface1, bg = color.none },
					TelescopePromptTitle = { fg = color.text, bg = color.none },
					TelescopePreviewTitle = { fg = color.text, bg = color.none },
					TelescopeResultsTitle = { fg = color.text, bg = color.none },
					TelescopePromptPrefix = { fg = color.text, bg = color.none },
					TelescopeSelection = { fg = color.text, bg = color.surface1 },
					TelescopeSelectionCaret = { fg = color.text, bg = color.surface1 },
					TelescopeMatching = { fg = color.red, bg = color.none },

					CodeActionNormal = { fg = color.text, bg = color.none },
					CodeActionBorder = { fg = color.surface1, bg = color.none },
					CodeActionText = { fg = color.text, bg = color.none },
					CodeActionNumber = { fg = color.green, bg = color.none },
					ActionPreviewNormal = { fg = color.text, bg = color.none },
					ActionPreviewBorder = { fg = color.surface1, bg = color.none },
					ActionPreviewTitle = { fg = color.text, bg = color.none },
					CursorLineNr = { fg = color.flamingo, bg = color.none },
					LineNr = { fg = color.flamingo, bg = color.none },
					LineNrAbove = { fg = color.surface1, bg = color.none },
					LineNrBelow = { fg = color.surface1, bg = color.none },
					ColorColumn = { fg = color.none, bg = color.surface0 },
					TreesitterContext = { fg = color.none, bg = color.none },
					TreesitterContextBottom = { bg = color.none, sp = color.surface1 },
					TreesitterContextLineNumberBottom = { bg = color.none, sp = color.surface1, underline = true },
					TreesitterContextLineNumber = { fg = color.flamingo, bg = color.none },
					NeoTreeIndentMarker = { bg = color.none, fg = color.surface0 },
					Directory = { bg = color.none, fg = color.text },
					CmpItemKindCodeium = { fg = color.sapphire },
					IncSearch = { fg = color.base, bg = color.peach },
					CurSearch = { fg = color.base, bg = color.peach },
					Search = { fg = color.none, bg = color.surface1 },
					MatchWord = { bg = color.peach, fg = color.base, bold = false },
					MatchParen = { bg = color.peach, fg = color.base, bold = false },
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
