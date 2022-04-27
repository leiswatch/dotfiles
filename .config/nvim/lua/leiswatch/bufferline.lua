require("bufferline").setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
		always_show_bufferline = false,
		show_close_icon = false,
		custom_filter = function(buf_number, buf_numbers)
			if vim.fn.bufname(buf_number) ~= "nnnpicker1" then
				return true
			end
		end,
	},
	-- highlights = {
	-- 	fill = {
	-- 		guifg = { attribute = "fg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "StatusLineNC" },
	-- 	},
	-- 	background = {
	-- 		guifg = { attribute = "fg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "StatusLine" },
	-- 	},
	-- 	buffer_visible = {
	-- 		guifg = { attribute = "fg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "Normal" },
	-- 	},
	-- 	buffer_selected = {
	-- 		guifg = { attribute = "fg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "Normal" },
	-- 	},
	-- 	separator = {
	-- 		guifg = { attribute = "bg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "StatusLine" },
	-- 	},
	-- 	separator_selected = {
	-- 		guifg = { attribute = "fg", highlight = "Special" },
	-- 		guibg = { attribute = "bg", highlight = "Normal" },
	-- 	},
	-- 	separator_visible = {
	-- 		guifg = { attribute = "fg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "StatusLineNC" },
	-- 	},
	-- 	close_button = {
	-- 		guifg = { attribute = "fg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "StatusLine" },
	-- 	},
	-- 	close_button_selected = {
	-- 		guifg = { attribute = "fg", highlight = "normal" },
	-- 		guibg = { attribute = "bg", highlight = "normal" },
	-- 	},
	-- 	close_button_visible = {
	-- 		guifg = { attribute = "fg", highlight = "normal" },
	-- 		guibg = { attribute = "bg", highlight = "normal" },
	-- 	},
	-- },
})
