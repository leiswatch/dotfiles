local lspconfig = require("lspconfig")

require("mason").setup({
	ui = {
		border = "single",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"astro",
		"cssls",
		"cssmodules_ls",
		"denols",
		"dockerls",
		"emmet_ls",
		"eslint",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"prismals",
		"pyright",
		"rust_analyzer",
		"stylelint_lsp",
		"sumneko_lua",
		"svelte",
		"tailwindcss",
		"terraformls",
		"tsserver",
		"vuels",
		"yamlls",
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
	ensure_installed = {
		"eslint_d",
		"gofumpt",
		"goimports",
		"golangci_lint",
		"jsonlint",
		"luacheck",
		"prettier",
		"pylint",
		"stylua",
		"yamllint",
		"yapf",
	},
	automatic_installation = true,
	automatic_setup = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
	max_height = 20,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
	max_height = 20,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>e", "<cmd> lua vim.diagnostic.open_float({border='single'})<cr>", opts)
vim.keymap.set("n", "[d", "<cmd> lua vim.diagnostic.goto_prev({float={border='single'}})<cr>", opts)
vim.keymap.set("n", "]d", "<cmd> lua vim.diagnostic.goto_next({float={border='single'}})<cr>", opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	-- vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = false } end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig["rust_analyzer"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"rustup",
		"run",
		"stable",
		"rust-analyzer",
	},
})

lspconfig["sumneko_lua"].setup({
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			completion = {
				callSnippet = "Replace",
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["stylelint_lsp"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
	settings = {
		stylelintplus = {
			autoFixOnSave = false,
			autoFixOnFormat = true,
		},
	},
})

lspconfig["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

lspconfig["cssmodules_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescriptreact", "javascriptreact" },
})

lspconfig["graphql"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "graphql" },
})

lspconfig["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["svelte"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
})

lspconfig["jsonls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["yamlls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["gopls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["dockerls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["tailwindcss"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["prismals"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["eslint"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		codeActionOnSave = {
			enable = true,
			mode = "all",
		},
		run = "onType",
	},
	validate = "on",
	workingDirectory = {
		mode = "location",
	},
})

-- lspconfig["emmet_ls"].setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
