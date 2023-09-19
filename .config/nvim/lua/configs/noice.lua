require("noice").setup({
	throttle = 1000 / 30,
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
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
			auto_open = {
				enabled = true,
				trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
				luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
				throttle = 50, -- Debounce lsp signature help request by 50ms
			},
		},
		documentation = {
			view = "hover",
			opts = {
				replace = true,
				relative = "cursor",
				render = "plain",
				position = 2,
				border = {
					padding = { 0, 1 },
					style = "rounded",
				},
				win_options = {
					winblend = 0,
				},
			},
		},
	},
	messages = {
		enabled = false,
	},
	cmdline = {
		enabled = false,
	},
	notify = {
		enabled = false,
	},
	popupmenu = {
		enabled = false,
		backend = "nui",
	},
})
