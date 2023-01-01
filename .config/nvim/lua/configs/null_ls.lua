local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	update_in_insert = true,
	sources = {
		diagnostics.pylint,
		diagnostics.jsonlint.with({
			filetypes = { "json" },
		}),
		diagnostics.luacheck,
    diagnostics.eslint_d,
    code_actions.eslint_d,
	},
})
