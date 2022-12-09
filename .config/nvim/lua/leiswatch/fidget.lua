require("fidget").setup({
	fmt = {
		stack_upwards = true,
	},
	align = {
		bottom = false, -- align fidgets along bottom edge of buffer
		right = true, -- align fidgets along right edge of buffer
	},
	timer = {
		spinner_rate = 165,
		fidget_decay = 1000,
	},
	window = {
		blend = 0,
		border = "rounded",
	},
	--[[ sources = { -- Sources to configure ]]
		--[[ ["null-ls"] = { -- Name of source ]]
		--[[ 	ignore = true, -- Ignore notifications from this source ]]
		--[[ }, ]]
	--[[ }, ]]
})
