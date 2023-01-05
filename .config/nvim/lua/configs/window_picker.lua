require("window-picker").setup({
	autoselect_one = true,
  include_current_win = false,
	filter_rules = {
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify" },

			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
  fg_color = '#11111b',
	other_win_hl_color = "#a6e3a1",
})
