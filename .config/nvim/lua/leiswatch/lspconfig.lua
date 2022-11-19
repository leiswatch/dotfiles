local saga = require("lspsaga")
local lua_dev = require("neodev")
--[[ local mason_lspconfig = require("mason-lspconfig") ]]
local lspconfig = require("lspconfig")

saga.init_lsp_saga({
	border_style = "rounded",
	code_action_icon = "",
	code_action_lightbulb = {
		enable = true,
		enable_in_insert = true,
		cache_code_action = true,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = false,
	},
})

lua_dev.setup()

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

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
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
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
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({timeout=2000})<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>tr", "<cmd>:TypescriptRenameFile<cr>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>ti",
		':lua require("typescript").actions.addMissingImports()<cr>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>tf", ':lua require("typescript").actions.fixAll()<cr>', opts)

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.sumneko_lua.setup({
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

require("typescript").setup({
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
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
		useESLintClass = true,
		format = false,
		validate = "on",
		packageManager = "yarn",
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
		},
	},
})

--[[ lspconfig.emmet_ls.setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" }, ]]
--[[ 	init_options = { ]]
--[[ 		html = { ]]
--[[ 			options = { ]]
--[[ 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267 ]]
--[[ 				["bem.enabled"] = true, ]]
--[[ 			}, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ }) ]]

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
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
