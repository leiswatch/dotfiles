local colors = require("catppuccin.palettes").get_palette()

require("bufferline").setup({

	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	--[[ highlights = { ]]
	--[[ 	fill = { ]]
	--[[ 		fg = colors.text, ]]
	--[[ 		bg = colors.surface0, ]]
	--[[ 	}, ]]
	--[[ 	buffer_visible = { ]]
	--[[ 		fg = colors.base, ]]
	--[[ 		bg = colors.surface0, ]]
	--[[ 	}, ]]
	--[[ 	buffer_selected = { ]]
	--[[ 		fg = colors.text, ]]
	--[[ 		bg = colors.surface0, ]]
	--[[ 		bold = true, ]]
	--[[ 		italic = true, ]]
	--[[ 	}, ]]
	--[[ 	numbers_visible = { ]]
	--[[ 		fg = colors.base, ]]
	--[[ 		bg = colors.surface0, ]]
	--[[ 	}, ]]
	--[[ 	numbers_selected = { ]]
	--[[ 		fg = colors.text, ]]
	--[[ 		bg = colors.surface0, ]]
	--[[ 		bold = true, ]]
	--[[ 		italic = true, ]]
	--[[ 	}, ]]
	--[[ }, ]]
	options = {
		mode = "buffers",
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		color_icons = true,
		show_close_icon = false,
		always_show_bufferline = false,
		show_buffer_close_icons = false,
	},
})
