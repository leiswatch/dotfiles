return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	enabled = true,
	config = function()
		require("tokyonight").setup({
			cache = true,
			plugins = {
				all = true,
				auto = true,
			},
			style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light transparent = true, -- Enable this to disable setting the background color
			transparent = false,
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = false },
				variables = { italic = false },
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			sidebars = { "qf", "help", "neo-tree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
			on_colors = function(colors)
				colors.bg_dark_alt = "#1f2335"
			end,
			on_highlights = function(hl, color)
				hl.FloatBorder = { fg = color.fg_gutter, bg = color.none }
				hl.FloatTitle = { fg = color.fg, bg = color.none }

				hl.HarpoonBorder = { fg = color.fg_gutter, bg = color.none }

				hl.NeotreeNormal = { fg = color.fg, bg = color.none }
				hl.Neotree = { fg = color.fg, bg = color.none }
				hl.NeotreeDirectoryIcon = { bg = color.none, fg = color.yellow }

				hl.CodeActionNormal = { fg = color.fg, bg = color.none }
				hl.CodeActionBorder = { fg = color.fg_gutter, bg = color.none }
				hl.CodeActionText = { fg = color.fg, bg = color.none }
				hl.CodeActionNumber = { fg = color.green, bg = color.none }
				hl.ActionPreviewNormal = { fg = color.fg, bg = color.none }
				hl.ActionPreviewBorder = { fg = color.fg_gutter, bg = color.none }
				hl.ActionPreviewTitle = { fg = color.fg, bg = color.none }

				hl.CursorLineNr = { fg = color.blue, bg = color.none }
				hl.CursorLine = { fg = color.none, bg = color.bg_highlight }
				hl.LineNr = { fg = color.blue, bg = color.none }
				hl.LineNrAbove = { fg = color.fg_gutter, bg = color.none }
				hl.LineNrBelow = { fg = color.fg_gutter, bg = color.none }
				hl.ColorColumn = { fg = color.none, bg = color.bg_highlight }

				hl.TreesitterContext = { fg = color.none, bg = color.bg_dark }
				hl.TreesitterContextBottom = { bg = color.none, sp = color.none, underline = false }
				hl.TreesitterContextLineNumberBottom = { bg = color.none, sp = color.none, underline = false }
				hl.TreesitterContextLineNumber = { fg = color.blue, bg = color.bg_dark, underline = false }

				hl.Directory = { bg = color.none, fg = color.fg }
				hl.IncSearch = { fg = color.bg, bg = color.orange }
				hl.CurSearch = { fg = color.bg, bg = color.orange }
				hl.Search = { fg = color.none, bg = color.fg_gutter }
				hl.Substitute = { fg = color.bg, bg = color.orange }
				hl.MatchWord = { bg = color.blue7, fg = color.none, bold = false }
				hl.MatchParen = { bg = color.blue7, fg = color.none, bold = false }

				hl.CmpNormal = { bg = color.black }
				hl.CmpItemKindVariable = { bg = color.none, fg = color.magenta }
				hl.CmpItemAbbrMatch = { bg = color.none, fg = color.red }
				hl.CmpItemAbbrMatchFuzzy = { bg = color.none, fg = color.red }

				hl.DiagnosticUnderlineError = { underline = true, sp = color.red }
				hl.DiagnosticUnderlineWarn = { underline = true, sp = color.yellow }
				hl.DiagnosticUnderlineInfo = { underline = true, sp = color.blue2 }
				hl.DiagnosticUnderlineHint = { underline = true, sp = color.teal }

				hl.FzfLuaBackdrop = { fg = color.none, bg = color.bg }
				hl.FzfLuaBorder = { fg = color.fg_gutter, bg = color.none }
				hl.FzfLuaTitle = { fg = color.fg, bg = color.none }
				hl.FzfLuaPreviewTitle = { fg = color.fg, bg = color.none }

				hl.LazyGitBorder = { fg = color.fg_gutter, bg = color.none }

				hl.MiniJump = { fg = color.red, bg = color.fg_gutter }

				hl.PounceMatch = { fg = color.fg, bg = color.fg_gutter }
				hl.PounceAcceptBest = { fg = color.bg, bg = color.red }
				hl.PounceGap = { fg = color.bg, bg = color.green2 }

				hl.HighlightYank = { fg = color.bg, bg = color.orange }

				hl.DashboardButtons = { fg = color.yellow, bg = color.bg }

				hl.SnacksInputTitle = { fg = color.fg, bg = color.none }
				hl.SnacksPickerTitle = { fg = color.fg, bg = color.none }
				hl.SnacksPickerIdx = { fg = color.blue, bg = color.none }
				hl.SnacksPickerPrompt = { fg = color.magenta, bg = color.none }
				hl.SnacksPickerInputBorder = { fg = color.fg_gutter, bg = color.none }
				hl.SnacksPickerBoxTitle = { fg = color.fg, bg = color.none }
				hl.SnacksIndent = { fg = color.bg_highlight, bg = color.none }

				hl.MatchTag = { bg = color.bg_highlight, fg = color.none, bold = false }
				hl.MatchTagError = { fg = color.none, bg = color.none }

				-- hl.TelescopeBorder = { fg = color.fg_gutter, bg = color.none }
				-- hl.TelescopePreviewBorder = { fg = color.fg_gutter, bg = color.none }
				-- hl.TelescopeResultsBorder = { fg = color.fg_gutter, bg = color.none }
				-- hl.TelescopePromptBorder = { fg = color.fg_gutter, bg = color.none }
				-- hl.TelescopePromptTitle = { fg = color.fg, bg = color.none }
				-- hl.TelescopePreviewTitle = { fg = color.fg, bg = color.none }
				-- hl.TelescopeResultsTitle = { fg = color.fg, bg = color.none }
				-- hl.TelescopePromptPrefix = { fg = color.fg, bg = color.none }
				-- hl.TelescopeSelection = { fg = color.fg, bg = color.fg_gutter }
				-- hl.TelescopeSelectionCaret = { fg = color.fg, bg = color.fg_gutter }
				-- hl.TelescopeMatching = { fg = color.red, bg = color.none }
			end,
		})

		vim.cmd("highlight link matchTag MatchTag")
		vim.cmd("highlight link matchTagError MatchTagError")
		vim.cmd("colorscheme tokyonight")
	end,
}
