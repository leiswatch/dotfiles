return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local colors = require("tokyonight.colors").setup()
		require("hlchunk").setup({
			chunk = {
				enable = false,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "─",
				},
				style = { colors.purple },
				max_file_size = 1024 * 128,
				duration = 100,
				delay = 300,
			},
			indent = {
				enable = true,
				delay = 300,
				style = { colors.bg_highlight },
				filter_list = {
					function(v)
						return v.level ~= 1
					end,
				},
				chars = { "┊" },
			},
		})
	end,
}
