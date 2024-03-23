local lspconfig = require("lspconfig")
require("lspconfig.ui.windows").default_options.border = "single"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	-- tailwindcss = {},
	-- "denols",
	clangd = {
		{ offsetEncoding = { "utf-16" } },
	},
	astro = {},
	html = {},
	svelte = {},
	jsonls = {},
	yamlls = {},
	gopls = {},
	pyright = {},
	templ = {},
	dockerls = {},
	prismals = {},

	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},

	rust_analyzer = {
		cmd = {
			"rustup",
			"run",
			"stable",
			"rust-analyzer",
		},
	},

	cssmodules_ls = {
		capabilities = {
			definitionProvider = false,
		},
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},

	graphql = {
		filetypes = { "graphql" },
	},

	cssls = {
		filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
	},

	eslint = {
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
	},

	stylelint_lsp = {
		filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
		settings = {
			stylelintplus = {
				autoFixOnFormat = true,
				autoFixOnSave = false,
				validateOnSave = false,
				validateOnType = true,
			},
		},
	},

	-- emmet_ls = {
	-- 	filetypes = {
	-- 		"css",
	-- 		"html",
	-- 		"javascriptreact",
	-- 		"less",
	-- 		"sass",
	-- 		"scss",
	-- 		"typescriptreact",
	-- 	},
	-- },

	-- tsserver = {
	-- 	init_options = {
	-- 		hostInfo = "neovim",
	-- 		maxTsServerMemory = 4096,
	-- 		-- preferences = {
	-- 		--     importModuleSpecifierPreference = "relative",
	-- 		-- },
	-- 	},
	-- },
}

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

require("mason").setup({
	ui = {
		border = "single",
		height = 0.8,
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"luacheck",
		"golangci-lint",
		"pylint",
		"yamllint",
		"prettier",
		"prettierd",
		"goimports",
		"gofumpt",
		"black",
		"yapf",
		"stylua",
		"clang-format",
		"stylelint",
		-- "jsonlint",
		-- "eslint_d",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 10000, -- 10 seconds delay
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

local handlers = {
	function(server_name)
		local server = servers[server_name] or {}
		server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
		lspconfig[server_name].setup(server)
	end,
	["tsserver"] = function()
		require("typescript-tools").setup({
			capabilities = capabilities,
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
				-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
				-- "remove_unused_imports"|"organize_imports") -- or string "all"
				-- to include all supported code actions
				-- specify commands exposed as code_actions
				expose_as_code_action = {},
				tsserver_plugins = {},
				-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
				-- memory limit in megabytes or "auto"(basically no limit)
				tsserver_max_memory = "2048",
				-- described below
				tsserver_format_options = {},
				tsserver_file_preferences = {},
				-- locale of all tsserver messages, supported locales you can find here:
				-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
				tsserver_locale = "en",
				-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
				complete_function_calls = false,
				include_completions_with_insert_text = true,
				-- CodeLens
				-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
				-- possible values: ("off"|"all"|"implementations_only"|"references_only")
				code_lens = "off",
				-- by default code lenses are displayed on all referencable values and for some of you it can
				-- be too much this option reduce count of them by removing member references from lenses
				disable_member_code_lens = true,
				-- JSXCloseTag
				-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
				-- that maybe have a conflict if enable this feature. )
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
			},
		})
	end,
}

require("mason-lspconfig").setup({
	handlers = handlers,
	ensure_installed = {
		"astro",
		"cssls",
		"cssmodules_ls",
		"dockerls",
		"eslint",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"prismals",
		"pyright",
		"rust_analyzer",
		"lua_ls",
		"svelte",
		"terraformls",
		"tsserver",
		"vuels",
		"yamlls",
		"clangd",
		"templ",
		"stylelint_lsp",
		-- "emmet_ls",
		-- "denols",
		-- "tailwindcss",
	},
	automatic_installation = true,
})
