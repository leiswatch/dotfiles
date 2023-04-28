require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = false,
		},
		progress = {
			enabled = false,
		},
		hover = {
			enabled = true,
		},
		message = {
			enabled = false,
		},
		signature = {
			enabled = true,
		},
		documentation = {
			view = "hover",
			opts = {
				relative = "cursor",
				position = 2,
				border = {
					padding = { 0, 1 },
					style = "single",
				},
				win_options = {
					winblend = 0,
				},
			},
		},
	},
	cmdline = {
		enabled = false,
	},
	messages = {
		enabled = false,
	},
	notify = {
		enabled = false,
	},
	popupmenu = {
		enabled = false,
	},
})
