local null_ls = require("null-ls")

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

-- local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completion
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.black,
		formatting.yapf,
		formatting.goimports,
		formatting.gofumpt,
		formatting.clang_format,
		formatting.prettierd.with({
			extra_filetypes = { "astro", "sass" },
		}),

		diagnostics.golangci_lint,
		diagnostics.pylint,

		-- code_actions.gitsigns,
	},
})
