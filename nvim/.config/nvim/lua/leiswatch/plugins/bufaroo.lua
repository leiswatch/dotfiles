return {
	"leiswatch/bufaroo",
	-- dir = "/home/leiswatch/Projects/dev/bufaroo",
	keys = {
		{
			"J",
			function()
				require("bufaroo").toggle_window()
			end,
			{ noremap = true, silent = true, nowait = true },
		},
	},
	opts = {
		win_opts = {
			title = "Buffers",
			width = 0.6,
		},
	},
}
