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

	rust_analyzer = {
		cmd = {
			"rustup",
			"run",
			"stable",
			"rust-analyzer",
		},
	},

	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					-- Tells lua_ls where to find all the Lua files that you have loaded
					-- for your neovim configuration.
					library = {
						"${3rd}/luv/library",
						unpack(vim.api.nvim_get_runtime_file("", true)),
					},
					-- If lua_ls is really slow on your computer, you can try this instead:
					-- library = { vim.env.VIMRUNTIME },
				},
				completion = {
					callSnippet = "Replace",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},

	tsserver = {
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
	},

	cssmodules_ls = {
		filetypes = { "typescriptreact", "javascriptreact", "css", "scss" },
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

	emmet_ls = {
		filetypes = {
			"css",
			"html",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"typescriptreact",
		},
	},

	stylelint_lsp = {
		filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
		settings = {
			stylelintplus = {
				autoFixOnFormat = true,
				autoFixOnSave = false,
			},
		},
	},
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
		"goimports",
		"gofumpt",
		"black",
		"yapf",
		"stylua",
		"clang-format",
		-- "jsonlint",
		-- "eslint_d",
		-- "prettierd",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 10000, -- 10 seconds delay
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for tsserver)
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			lspconfig[server_name].setup(server)
		end,
	},
	ensure_installed = {
		"astro",
		"cssls",
		"cssmodules_ls",
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
		-- "denols",
		-- "tailwindcss",
	},
	automatic_installation = true,
})
