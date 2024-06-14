return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		require("tokyonight").setup({
			style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = {},
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
			---@param hl Highlights
			---@param color ColorScheme
			on_highlights = function(hl, color)
				hl.FloatBorder = { fg = color.fg_gutter, bg = color.none }
				hl.FloatTitle = { fg = color.fg, bg = color.none }
				hl.BufferManagerNormal = { fg = color.fg, bg = color.none }
				hl.BufferManagerBorder = { fg = color.fg_gutter, bg = color.none }
				hl.BufferManagerFloatTitle = { fg = color.fg, bg = color.none }
				hl.HarpoonBorder = { fg = color.fg_gutter, bg = color.none }
				hl.NeotreeNormal = { fg = color.fg, bg = color.none }
				hl.Neotree = { fg = color.fg, bg = color.none }

				hl.TelescopeBorder = { fg = color.fg_gutter, bg = color.none }
				hl.TelescopePreviewBorder = { fg = color.fg_gutter, bg = color.none }
				hl.TelescopeResultsBorder = { fg = color.fg_gutter, bg = color.none }
				hl.TelescopePromptBorder = { fg = color.fg_gutter, bg = color.none }
				hl.TelescopePromptTitle = { fg = color.fg, bg = color.none }
				hl.TelescopePreviewTitle = { fg = color.fg, bg = color.none }
				hl.TelescopeResultsTitle = { fg = color.fg, bg = color.none }
				hl.TelescopePromptPrefix = { fg = color.fg, bg = color.none }
				hl.TelescopeSelection = { fg = color.fg, bg = color.fg_gutter }
				hl.TelescopeSelectionCaret = { fg = color.fg, bg = color.fg_gutter }
				hl.TelescopeMatching = { fg = color.red, bg = color.none }

				hl.CodeActionNormal = { fg = color.fg, bg = color.none }
				hl.CodeActionBorder = { fg = color.fg_gutter, bg = color.none }
				hl.CodeActionText = { fg = color.fg, bg = color.none }
				hl.CodeActionNumber = { fg = color.green, bg = color.none }
				hl.ActionPreviewNormal = { fg = color.fg, bg = color.none }
				hl.ActionPreviewBorder = { fg = color.fg_gutter, bg = color.none }
				hl.ActionPreviewTitle = { fg = color.fg, bg = color.none }
				hl.CursorLineNr = { fg = color.blue5, bg = color.none }
				hl.LineNr = { fg = color.blue, bg = color.none }
				hl.LineNrAbove = { fg = color.fg_gutter, bg = color.none }
				hl.LineNrBelow = { fg = color.fg_gutter, bg = color.none }
				hl.ColorColumn = { fg = color.none, bg = color.bg_highlight }
				hl.TreesitterContext = { fg = color.none, bg = color.bg_highlight }
				hl.TreesitterContextBottom = { bg = color.none, sp = color.none }
				hl.TreesitterContextLineNumberBottom = { bg = color.none, sp = color.none, underline = false }
				hl.TreesitterContextLineNumber = { fg = color.blue, bg = color.bg_highlight }
				hl.NeoTreeIndentMarker = { bg = color.none, fg = color.bg_highlight }
				hl.Directory = { bg = color.none, fg = color.fg }
				hl.IncSearch = { fg = color.bg, bg = color.orange }
				hl.CurSearch = { fg = color.bg, bg = color.orange }
				hl.Search = { fg = color.none, bg = color.fg_gutter }
				hl.MatchWord = { bg = color.orange, fg = color.bg, bold = false }
				hl.MatchParen = { bg = color.orange, fg = color.bg, bold = false }
			end,
		})

		vim.cmd([[colorscheme tokyonight]])
	end,
}
