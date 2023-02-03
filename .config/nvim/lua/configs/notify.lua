local notify = require("notify")

notify.setup({
	fps = 60,
	background_colour = "#000000",
})

vim.notify = notify
