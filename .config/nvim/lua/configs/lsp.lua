local lspconfig = require("lspconfig")

require("mason").setup({
	ui = {
		border = "rounded",
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
		-- "eslint",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"prismals",
		"pyright",
		"rust_analyzer",
		-- "stylelint_lsp",
		"lua_ls",
		"svelte",
		"terraformls",
		"tsserver",
		"vuels",
		"yamlls",
		"clangd",
	},
	automatic_installation = true,
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"luacheck",
		"golangci-lint",
		"pylint",
		"yamllint",
		"jsonlint",
		"eslint_d",
		"prettier",
		"prettierd",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 3000, -- 3 second delay
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	title = " Hover ",
	max_height = 15,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	title = " Signature ",
	max_height = 20,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
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

vim.keymap.set(
	"n",
	"<leader>e",
	"<cmd> lua vim.diagnostic.open_float({border='rounded', max_width=100, title=' Diagnostics ', header='', source='if_many' })<cr>",
	opts
)
vim.keymap.set(
	"n",
	"[d",
	"<cmd> lua vim.diagnostic.goto_prev({float={border='rounded', max_width=100, title=' Diagnostics ', header='', source='if_many' }})<cr>",
	opts
)
vim.keymap.set(
	"n",
	"]d",
	"<cmd> lua vim.diagnostic.goto_next({float={border='rounded', max_width=100, title=' Diagnostics ', header='', source='if_many' }})<cr>",
	opts
)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

local custom_on_attach = function(client, bufnr)
	-- client.server_capabilities.semanticTokensProvider = nil
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
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	-- vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	vim.keymap.set("n", "gl", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "gl", "<cmd>Lspsaga finder<CR>", bufopts)

	-- vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = false } end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig["rust_analyzer"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	cmd = {
		"rustup",
		"run",
		"stable",
		"rust-analyzer",
	},
})

lspconfig["lua_ls"].setup({
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			completion = {
				callSnippet = "Replace",
			},
		},
	},
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

-- lspconfig["stylelint_lsp"].setup({
-- 	on_attach = custom_on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
-- 	settings = {
-- 		stylelintplus = {
-- 			autoFixOnSave = false,
-- 			autoFixOnFormat = true,
-- 		},
-- 	},
-- })

lspconfig["tsserver"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	init_options = {
		tsserver = { maxTsServerMemory = 4096 },
	},
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

-- require("typescript-tools").setup({
-- 	on_attach = custom_on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		-- spawn additional tsserver instance to calculate diagnostics on it
-- 		separate_diagnostic_server = true,
-- 		-- "change"|"insert_leave" determine when the client asks the server about diagnostic
-- 		publish_diagnostic_on = "insert_leave",
-- 		-- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
-- 		-- specify commands exposed as code_actions
-- 		expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
-- 		-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
-- 		-- not exists then standard path resolution strategy is applied
-- 		tsserver_path = nil,
-- 		-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
-- 		-- (see 💅 `styled-components` support section)
-- 		tsserver_plugins = {},
-- 		-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
-- 		-- memory limit in megabytes or "auto"(basically no limit)
-- 		tsserver_max_memory = "auto",
-- 		-- described below
-- 		tsserver_format_options = {},
-- 		tsserver_file_preferences = {},
-- 		-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
-- 		complete_function_calls = false,
-- 	},
-- })

lspconfig["cssmodules_ls"].setup({
	on_attach = function(client)
		client.server_capabilities.definitionProvider = false
		custom_on_attach(client)
	end,
	capabilities = capabilities,
	filetypes = { "typescriptreact", "javascriptreact", "scss", "css", "less", "sass" },
})

lspconfig["graphql"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	filetypes = { "graphql" },
})

lspconfig["html"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["svelte"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["cssls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
})

lspconfig["jsonls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["yamlls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["pyright"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["gopls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["dockerls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

-- lspconfig["tailwindcss"].setup({
-- 	on_attach = custom_on_attach,
-- 	capabilities = capabilities,
-- })

lspconfig["prismals"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

-- lspconfig["eslint"].setup({
-- 	on_attach = custom_on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		codeAction = {
-- 			disableRuleComment = {
-- 				enable = true,
-- 				location = "separateLine",
-- 			},
-- 			showDocumentation = {
-- 				enable = true,
-- 			},
-- 		},
-- 		codeActionOnSave = {
-- 			enable = true,
-- 			mode = "all",
-- 		},
-- 		format = true,
-- 		run = "onType",
-- 		validate = "on",
-- 		workingDirectory = {
-- 			mode = "location",
-- 		},
-- 	},
-- })

lspconfig["clangd"].setup({
	on_attach = custom_on_attach,
	capabilities = vim.tbl_deep_extend("error", capabilities, { offsetEncoding = { "utf-16" } }),
})

-- lspconfig["emmet_ls"].setup({
-- 	on_attach = custom_on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = {
-- 		"css",
-- 		"html",
-- 		"javascriptreact",
-- 		"less",
-- 		"sass",
-- 		"scss",
-- 		"typescriptreact",
-- 	},
-- })
