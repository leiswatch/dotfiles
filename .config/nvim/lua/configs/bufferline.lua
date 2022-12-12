local bufferline = require("bufferline")
local mocha = require("catppuccin.palettes").get_palette("mocha")

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get({
		styles = { "italic", "bold" },
		custom = {
			all = {
				fill = { bg = mocha.mantle },
				indicator_selected = {
					bg = mocha.surface0,
					fg = mocha.rosewater,
				},
				buffer_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				numbers_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				diagnostic_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				hint_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				hint_diagnostic_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				info_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				info_diagnostic_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				warning_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				warning_diagnostic_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				error_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				error_diagnostic_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
				modified_selected = {
					bg = mocha.surface0,
				},
				duplicate_selected = {
					bg = mocha.surface0,
					italic = true,
				},
				separator_selected = {
					bg = mocha.surface0,
				},
				pick_selected = {
					bg = mocha.surface0,
					bold = true,
					italic = true,
				},
			},
		},
	}),
	options = {
		mode = "buffers",
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = false,
			},
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
