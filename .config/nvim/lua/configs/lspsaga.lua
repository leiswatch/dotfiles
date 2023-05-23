local saga = require("lspsaga")

saga.setup({
	ui = {
		title = false,
		border = "single",
		winblend = 0,
		code_action = " ",
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
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
	beacon = {
		enable = false,
	},
	finder = {
		keys = {
			jump_to = "p",
			expand_or_jump = "<CR>",
			vsplit = "s",
			split = "i",
			tabe = "t",
			tabnew = "r",
			quit = { "q", "<ESC>", "<C-[>" },
			close_in_preview = "<ESC>",
		},
	},
})
