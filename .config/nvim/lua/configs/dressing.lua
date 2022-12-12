require('dressing').setup({
	input = {
		win_options = {
			winblend = 0,
		},
		get_config = function()
			if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
				return { enabled = false }
			end
			if vim.api.nvim_buf_get_option(0, "filetype") == "neo-tree" then
				return { enabled = false }
			end
		end,
	}
})
