local helpers = require("leiswatch.helpers")
local lsp = require("leiswatch.lsp")

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"esmuellert/nvim-eslint",
		"yioneko/nvim-vtsls",
		"b0o/schemastore.nvim",
		-- "pmizio/typescript-tools.nvim",
		-- "saghen/blink.cmp",
		-- { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
	},
	config = function()
		local buf_number = vim.api.nvim_get_current_buf()
		local lspconfig = require("lspconfig")
		local servers = lsp.get_servers(require("schemastore"))
		require("lspconfig.ui.windows").default_options.border = "single"

		local eslint = require("nvim-eslint")

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		}
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))

		-- require("typescript-tools").setup({
		-- 	on_attach = function(client)
		-- 		client.capabilities = vim.tbl_deep_extend("force", {}, capabilities, client.capabilities or {})

		-- 		return client
		-- 	end,
		-- 	filetypes = {
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"javascript.jsx",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 		"typescript.tsx",
		-- 		"vue",
		-- 		"svelte",
		-- 		-- "astro",
		-- 	},
		-- 	settings = {
		-- 		separate_diagnostic_server = false,
		-- 	},
		-- })

		require("lspconfig.configs").vtsls = require("vtsls").lspconfig

		local eslint_config = {
			root_dir = function(bufnr)
				return eslint.resolve_git_dir(bufnr) or vim.uv.cwd()
			end,
			capabilities = capabilities,
			settings = {
				validate = "on",
				useESLintClass = true,
				useFlatConfig = function(bufnr)
					return helpers.find_config_files(bufnr, helpers.eslint_config_files)
				end,
				experimental = { useFlatConfig = false },
				codeAction = {
					disableRuleComment = { enable = true, location = "separateLine" },
					showDocumentation = { enable = true },
				},
				codeActionOnSave = { mode = "all" },
				format = true,
				quiet = false,
				nodePath = eslint.resolve_node_path,
				onIgnoredFiles = "off",
				run = "onType",
				problems = { shortenToSingleLine = false },
				workingDirectory = { mode = "location" },
				workspaceFolder = function(bufnr)
					local git_dir = eslint.resolve_git_dir(bufnr) or vim.uv.cwd()

					return {
						uri = vim.uri_from_fname(git_dir),
						name = vim.fn.fnamemodify(git_dir, ":t"),
					}
				end,
			},
		}

		for server_name, _ in pairs(servers) do
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			lspconfig[server_name].setup(server)
		end

		if helpers.find_config_files(buf_number, helpers.eslint_config_files) then
			eslint.setup(eslint_config)
		end
	end,
}
