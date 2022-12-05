local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	update_in_insert = true,
	sources = {
		-- Diagnostics
		diagnostics.pylint,
		diagnostics.jsonlint.with({
			filetypes = { "json" },
		}),
		diagnostics.zsh,
	},
})
