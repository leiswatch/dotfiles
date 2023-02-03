local saga = require("lspsaga")

saga.setup({
	ui = {
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    border = 'single',
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
})
