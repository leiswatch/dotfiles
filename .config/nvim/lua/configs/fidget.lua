require("fidget").setup({
	progress = {
		poll_rate = 0, -- How and when to poll for progress messages
		suppress_on_insert = false, -- Suppress new messages while in insert mode
		ignore_done_already = false, -- Ignore new tasks that are already complete
		ignore_empty_message = false, -- Ignore new tasks that don't contain a message
		ignore = { "null-ls" },
	},
	notification = {
		window = {
			normal_hl = "Comment", -- Base highlight group in the notification window
			winblend = 0, -- Background color opacity in the notification window
			border = "single", -- Border around the notification window
			zindex = 45, -- Stacking priority of the notification window
			max_width = 0, -- Maximum width of the notification window
			max_height = 0, -- Maximum height of the notification window
			x_padding = 0, -- Padding from right edge of window boundary
			y_padding = 0, -- Padding from bottom edge of window boundary
			align = "bottom", -- Whether to bottom-align the notification window
			relative = "editor", -- What the notification window position is relative to
		},
	},
})
