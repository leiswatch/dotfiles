local bufferline = require("bufferline")
-- local mocha = require("catppuccin.palettes").get_palette("mocha")
local highlights = require('rose-pine.plugins.bufferline')

bufferline.setup({
  highlights = highlights,
  -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
	-- highlights = require("catppuccin.groups.integrations.bufferline").get({
	-- 	styles = { "bold" },
	-- 	custom = {
	-- 		all = {
	-- 			fill = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			background = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			tab = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			tab_selected = {
	-- 				bg = mocha.text,
	-- 				fg = mocha.surface0,
	-- 			},
	-- 			tab_close = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			close_button = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			close_button_visible = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			close_button_selected = {
	-- 				bg = mocha.text,
	-- 				fg = mocha.surface0,
	-- 			},
	-- 			buffer_visible = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			buffer_selected = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			numbers = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			numbers_visible = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.crust,
	-- 			},
	-- 			numbers_selected = {
	-- 				fg = mocha.text,
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			diagnostic = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			diagnostic_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			diagnostic_selected = {
	-- 				bg = mocha.surface1,
	-- 				bold = true,
	-- 				italic = true,
	-- 			},
	-- 			hint = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			hint_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			hint_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			hint_diagnostic = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			hint_diagnostic_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			hint_diagnostic_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			info = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			info_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			info_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			info_diagnostic = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			info_diagnostic_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			info_diagnostic_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			warning = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			warning_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			warning_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			warning_diagnostic = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			warning_diagnostic_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			warning_diagnostic_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			error = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			error_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			error_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			error_diagnostic = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			error_diagnostic_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			error_diagnostic_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			modified = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			modified_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			modified_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			duplicate_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			duplicate_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			duplicate = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			separator_selected = {
	-- 				bg = mocha.surface1,
	-- 			},
	-- 			separator_visible = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			separator = {
	-- 				bg = mocha.crust,
	-- 			},
	-- 			indicator_selected = {
	-- 				bg = mocha.surface1,
	-- 				fg = mocha.text,
	-- 			},
	-- 		},
	-- 	},
	-- }),
	options = {
		mode = "buffers",
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		color_icons = true,
		show_close_icon = false,
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
