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
		"zsh",
		"pylint",
		"jsonlint",
	},
	automatic_installation = true,
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"astro",
		"cssls",
		"cssmodules_ls",
		"dockerls",
		"emmet_ls",
		"eslint",
		"golangci_lint_ls",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"pyright",
		"rust_analyzer",
		"stylelint_lsp",
		"sumneko_lua",
		"tailwindcss",
		"tsserver",
		"yamlls",
	},
	automatic_installation = true,
})
