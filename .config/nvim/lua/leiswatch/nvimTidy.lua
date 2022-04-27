require("tidy").setup({
	eof_quant = 0,
	fmts = { -- the types of formattings to apply
		"eof", -- removes lines at end of file
		"multi", -- condenses multiple newlines into one
		"sof", -- removes lines at start of file
		"ws", -- removes trailing whitespace
	},
})
