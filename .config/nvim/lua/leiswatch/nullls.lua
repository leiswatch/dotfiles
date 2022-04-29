local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Diagnostics
		diagnostics.pylint,
		diagnostics.eslint_d.with({
			filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
		}),
		diagnostics.stylelint.with({
			filetypes = { "scss", "less", "css", "sass" },
			prefer_local = "node_modules/.bin",
		}),
		diagnostics.golangci_lint,

		-- Formatters
		-- formatting.prettier.with({
		-- filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "html", "yaml" },
		-- prefer_local = "node_modules/.bin",
		-- }),
		formatting.eslint_d.with({
			filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
		}),
		formatting.stylelint.with({
			filetypes = { "scss", "less", "css", "sass" },
			prefer_local = "node_modules/.bin",
		}),
		formatting.yapf,
		formatting.gofmt,
		formatting.rustfmt,
		formatting.stylua,
	},
})
