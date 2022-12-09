local lspconfig = require("lspconfig")

local opts = {
	noremap = true,
	silent = true,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gi",
		"<cmd>lua vim.lsp.buf.implementation({ border = 'rounded' })<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<C-k>",
		"<cmd>lua vim.lsp.buf.signature_help({ border = 'rounded' })<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) ]]
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) ]]
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>:Neoformat<CR>", opts)

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			hint = {
				enable = true,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.stylelint_lsp.setup({
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

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssmodules_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescriptreact", "javascriptreact" },
})

lspconfig.graphql.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "graphql" },
})

lspconfig.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		run = "onType",
		useESLintClass = false,
		codeActionOnSave = {
			enable = true,
			mode = "all",
		},
		format = true,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.gopls.setup({
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.golangci_lint_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
