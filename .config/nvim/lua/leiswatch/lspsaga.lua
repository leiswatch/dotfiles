local lspsaga = require("lspsaga")
local custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind();

lspsaga.init_lsp_saga({
  border_style = "rounded",
  saga_winblend = 0,
	custom_kind = custom_kind,
  code_action_icon = " ",
	code_action_lightbulb = {
		enable = true,
		enable_in_insert = true,
		cache_code_action = false,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = false,
	},
})
