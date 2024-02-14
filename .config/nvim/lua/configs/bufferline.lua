local bufferline = require("bufferline")

bufferline.setup({
	options = {
		style_preset = {
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
			bufferline.style_preset.minimal,
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neotree",
				highlight = "Directory",
				separator = false, -- use a "true" to enable the default, or set your own character
                text_align = "center",
                padding = 0,
			},
		},
		diagnostics = false,
		always_show_bufferline = false,
		custom_filter = function(buf_number, buf_numbers)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= "alpha" then
				return true
			end
		end,
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
