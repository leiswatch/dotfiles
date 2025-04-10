local ensure_installed = {
	"astro",
	"basedpyright",
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
	"denols",
	"dockerls",
	"eslint",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"lua_ls",
	"prismals",
	"rust_analyzer",
	"somesass_ls",
	"stylelint_lsp",
	"svelte",
	"tailwindcss",
	"taplo",
	"templ",
	"ts_ls",
	"vtsls",
	"yamlls",
	"zls",
	-- "htmx",
	-- "terraformls",
	-- "vuels",
	-- "emmet_ls",
}

local ensure_installed_tools = {
	"black",
	"clang-format",
	"gofumpt",
	"goimports",
	"golangci-lint",
	"luacheck",
	"prettier",
	"prettierd",
	"pylint",
	"selene",
	"shellcheck",
	"shfmt",
	"stylua",
	"yamllint",
	"yapf",
	-- "stylelint",
	-- "jsonlint",
	-- "eslint_d",
}

local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			max_concurrent_installers = 3,
			ui = {
				border = "single",
				height = 0.8,
				backdrop = 100,
				icons = {
					package_installed = " ",
					package_pending = " ",
					package_uninstalled = " ",
				},
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed_tools,
			auto_update = false,
			run_on_start = true,
			start_delay = 10000, -- 10 seconds delay
			debounce_hours = 5, -- at least 5 hours between attempts to install/update
		})

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
		})
	end,
}

return M
