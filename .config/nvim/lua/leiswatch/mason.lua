require("mason-update-all").setup()
require("mason-null-ls").setup()

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		check_outdated_packages_on_open = true,
		border = "rounded",
	},
	ensure_installed = {
		"css-lsp",
		"json-lsp",
		"vim-language-server",
		"lua-language-server",
		"yaml-language-server",
		"typescript-language-server",
		"eslint_d",
		"pyright",
		"yaml-language-server",
		"tailwindcss-language-server",
		"rust-analyzer",
		"graphql-language-service-cli",
		"stylelint-lsp",
		"gofumpt",
		"gopls",
	},
	auto_update = true,
	run_on_start = true,
})

require("mason-null-ls").setup({
	ensure_installed = {
		"stylua",
		"eslint_d",
		"pylint",
		"jsonlint",
		"golangci-lint",
		"stylelint",
		"yapf",
		"gofmt",
		"rustfmt",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"cssls",
		"cssmodules_ls",
		"dockerls",
		--[[ "eslint", ]]
		"emmet_ls",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"tsserver",
		"sumneko_lua",
		"pyright",
		"stylelint_lsp",
		"yamlls",
		"rust_analyzer",
		"dockerls",
	},
	automatic_installation = true,
})
