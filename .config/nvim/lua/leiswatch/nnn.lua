require("nnn").setup({
	explorer = {
		cmd = "nnn -H",
		width = 50,
	},
	picker = {
    cmd = "nnn -H",
		style = {
			border = "rounded",
		},
	},
	auto_close = true,
	replace_netrw = "picker",
})
