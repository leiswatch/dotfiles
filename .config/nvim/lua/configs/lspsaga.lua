local saga = require("lspsaga")

saga.setup({
	ui = {
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
		border = "single",
		winblend = 0,
		code_action = " ",
	},
	lightbulb = {
		enable = true,
		virtual_text = false,
	},
	symbol_in_winbar = {
		enable = false,
	},
	code_action = {
		num_shortcut = true,
		show_server_name = false,
		extend_gitsigns = true,
	},
	diagnostic = {
		on_insert = false,
	},
})
