return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
		"b0o/schemastore.nvim",
		"yioneko/nvim-vtsls",
		-- "pmizio/typescript-tools.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		require("lspconfig.ui.windows").default_options.border = "rounded"

		require("leiswatch.lsp.textDocument")
		require("leiswatch.lsp.signs")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local servers = require("leiswatch.lsp.servers")
		local mason_config = require("leiswatch.lsp.mason_config")

		-- local handlers = {
		-- 	function(server_name)
		-- 		local server = servers[server_name] or {}
		-- 		server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
		-- 		lspconfig[server_name].setup(server)
		-- 	end,
		-- }

		require("mason").setup({
			ui = {
				border = "rounded",
				height = 0.8,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = mason_config.tools,
			auto_update = false,
			run_on_start = true,
			start_delay = 10000, -- 10 seconds delay
			debounce_hours = 5, -- at least 5 hours between attempts to install/update
		})

		require("mason-lspconfig").setup({
			-- handlers = handlers,
			ensure_installed = mason_config.lsp,
			automatic_installation = true,
		})

		require("lspconfig.configs").vtsls = require("vtsls").lspconfig

		-- require("typescript-tools").setup({
		-- 	capabilities = capabilities,
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

		for server_name, _ in pairs(servers) do
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			lspconfig[server_name].setup(server)
		end
	end,
}
