local bufferline = require("bufferline")
local mocha = require("catppuccin.palettes").get_palette("mocha")

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get({
		styles = { "italic", "bold" },
		custom = {
			all = {
				fill = { bg = mocha.mantle },
				indicator_selected = {
					fg = mocha.rosewater,
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
