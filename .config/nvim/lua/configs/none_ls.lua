local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
-- local hover = null_ls.builtins.hover

-- completion sources
-- local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		-- FORMATTING
		-- lua
		-- formatting.stylua,
		-- python
		-- formatting.black,
		-- formatting.yapf,
		-- go
		-- formatting.goimports,
		-- formatting.gofumpt,
		-- c/c++
		-- formatting.clang_format,
		-- javascript/typescript/json/yaml/graphql/astro/css/sass/less
		-- formatting.eslint.with({
		-- 	extra_filetypes = { "astro" },
		-- }),
		-- formatting.eslint_d.with({
		-- 	extra_filetypes = { "astro" },
		-- }),
		-- formatting.prettier.with({
		-- 	extra_filetypes = { "astro", "sass" },
		-- }),
		-- formatting.stylelint,

		-- DIAGNOSTICS
		-- go
		diagnostics.golangci_lint,
		-- lua
		-- diagnostics.luacheck,
		-- python
		diagnostics.pylint,
		-- css/scss/sass/less
		diagnostics.stylelint,
		-- eslint
		-- diagnostics.eslint,

		-- CODE ACTIONS
		code_actions.gitsigns,
		-- code_actions.eslint,
	},
})
