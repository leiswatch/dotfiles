local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	update_in_insert = true,
	sources = {
		diagnostics.jsonlint,
		diagnostics.pylint,
		diagnostics.luacheck,
		-- diagnostics.eslint,
		diagnostics.golangci_lint,
		diagnostics.yamllint,
		diagnostics.trail_space,
		diagnostics.dotenv_linter,

		-- code_actions.eslint,
		-- code_actions.gitsigns,
	},
})
