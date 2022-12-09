require("lsp-inlayhints").setup({
	inlay_hints = {
		parameter_hints = {
			show = false,
		},
		type_hints = {
			show = true,
			prefix = "➜ ",
			remove_colon_start = true,
		},
		only_current_line = false,
	},
})
