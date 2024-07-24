return {
	"j-hui/fidget.nvim",
	opts = {
		progress = {
			poll_rate = 0, -- How and when to poll for progress messages
			suppress_on_insert = false, -- Suppress new messages while in insert mode
			ignore_done_already = false, -- Ignore new tasks that are already complete
			ignore_empty_message = false, -- Ignore new tasks that don't contain a message
			ignore = { "null-ls" },
			display = {
				done_icon = "",
			},
		},
		notification = {
			window = {
				winblend = 0, -- Background color opacity in the notification window
				border = "rounded", -- Border around the notification window
				max_width = 150, -- Maximum width of the notification window
				x_padding = 0, -- Padding from right edge of window boundary
				align = "bottom",
			},
		},
	},
}
