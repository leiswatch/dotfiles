local lspconfig = require("lspconfig")
require("lspconfig.ui.windows").default_options.border = "single"

require("mason").setup({
	ui = {
		border = "single",
		height = 0.8,
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
		"lua_ls",
		"svelte",
		"terraformls",
		"tsserver",
		"vuels",
		"yamlls",
		"clangd",
		"templ",
	},
	automatic_installation = true,
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"luacheck",
		"golangci-lint",
		"pylint",
		"yamllint",
		-- "jsonlint",
		-- "eslint_d",
		"prettier",
		-- "prettierd",
		"goimports",
		"gofumpt",
		"black",
		"yapf",
		"stylua",
		"clang-format",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 10000, -- 10 seconds delay
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
	title = "",
    max_width = 100,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
	title = "",
    max_width = 100,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- local function organize_imports()
-- 	local params = {
-- 		command = "_typescript.organizeImports",
-- 		arguments = { vim.api.nvim_buf_get_name(0) },
-- 		title = "",
-- 	}
-- 	vim.lsp.buf.execute_command(params)
-- end

local opts = { noremap = true, silent = true }

vim.keymap.set(
	"n",
	"<leader>e",
	"<cmd> lua vim.diagnostic.open_float({border='single', max_width=100, title='Diagnostics', header='', source=false })<cr>",
	opts
)
vim.keymap.set(
	"n",
	"[d",
	"<cmd> lua vim.diagnostic.goto_prev({float={border='single', max_width=100, title='Diagnostics', header='', source=false }})<cr>",
	opts
)
vim.keymap.set(
	"n",
	"]d",
	"<cmd> lua vim.diagnostic.goto_next({float={border='single', max_width=100, title='Diagnostics', header='', source=false }})<cr>",
	opts
)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

local custom_on_attach = function(client, bufnr)
	-- client.server_capabilities.semanticTokensProvider = nil
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	local lsp_formatting = function(bufnr)
		local filetype = vim.bo.filetype

		if
			vim.fn.exists(":EslintFixAll") ~= 0
			and (
				filetype == "javascript"
				or filetype == "typescript"
				or filetype == "typescriptreact"
				or filetype == "javascriptreact"
				or filetype == "astro"
				or filetype == "vue"
			)
		then
			vim.api.nvim_command(":EslintFixAll")
		end

		vim.lsp.buf.format({
			-- filter = function(client)
			-- 	return client.name == "null-ls" or client.name == "rust_analyzer"
			-- end,
			bufnr = bufnr,
			timeout_ms = 3000,
		})
	end

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<leader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gl", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", lsp_formatting, bufopts)
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

lspconfig["astro"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["tsserver"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	settings = {
		typescript = {
			implementationsCodeLens = {
				enabled = true,
				showOnInterfaceMethods = true,
			},
			referencesCodeLens = {
				enabled = true,
				showOnAllFunctions = true,
			},
			preferGoToSourceDefinition = true,
			tsserver = {
				maxTsServerMemory = 2048,
			},
		},
	},
})

lspconfig["cssmodules_ls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	filetypes = { "typescriptreact", "javascriptreact", "css", "scss" },
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

lspconfig["templ"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["dockerls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["clangd"].setup({
	on_attach = custom_on_attach,
	capabilities = vim.tbl_deep_extend("error", capabilities, { offsetEncoding = { "utf-16" } }),
})

lspconfig["prismals"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig["eslint"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = true,
			mode = "all",
		},
		format = true,
		run = "onType",
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
})

lspconfig["emmet_ls"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	filetypes = {
		"css",
		"html",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"typescriptreact",
	},
})

lspconfig["stylelint_lsp"].setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
			autoFixOnSave = false,
		},
	},
})

-- lspconfig["tailwindcss"].setup({
-- 	on_attach = custom_on_attach,
-- 	capabilities = capabilities,
-- })
