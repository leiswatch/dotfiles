return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
		"b0o/schemastore.nvim",
		"esmuellert/nvim-eslint",
		"soulsam480/nvim-oxlint",
		"yioneko/nvim-vtsls",
		{ "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
		-- "saghen/blink.cmp",
		-- "pmizio/typescript-tools.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local servers = {
			clangd = { capabilities = { offsetEncoding = { "utf-16" } } },
			astro = {},
			awk_ls = {},
			bashls = {},
			-- denols = {},
			dockerls = {},
			gopls = {},
			html = {},
			-- htmx = {},
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			prismals = {},
			pyright = {},
			svelte = {},
			templ = {},
			taplo = {},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},

			lua_ls = {
				settings = {
					Lua = {
						hint = { enable = true },
						telemetry = { enable = false },
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

			graphql = {
				filetypes = { "graphql" },
			},

			cssls = {},
			somesass_ls = {},
			cssmodules_ls = {},
			-- tailwindcss = {},
			-- css_variables = {},

			stylelint_lsp = {
				settings = {
					stylelintplus = {
						autoFixOnFormat = true,
						autoFixOnSave = false,
						validateOnSave = true,
						validateOnType = true,
					},
				},
			},

			-- eslint = {
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
			-- 			enable = false,
			-- 			mode = "all",
			-- 		},
			-- 		useFlatConfig = true,
			-- 		experimental = {
			-- 			useFlatConfig = false,
			-- 		},
			-- 		format = true,
			-- 		quiet = false,
			-- 		nodePath = nil,
			-- 		onIgnoredFiles = "off",
			-- 		problems = {
			-- 			shortenToSingleLine = false,
			-- 		},
			-- 		run = "onType",
			-- 		useESLintClass = true,
			-- 		validate = "on",
			-- 		workingDirectory = { mode = "location" },
			-- 	},
			-- },
			vtsls = {
				settings = {
					vtsls = {
						autoUseWorkspaceTsdk = true,
						experimental = {
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						preferGoToSourceDefinition = true,
						tsserver = {
							maxTsServerMemory = "auto",
						},
					},
					javascript = {
						preferGoToSourceDefinition = true,
					},
				},
			},
			zls = {},

			-- ts_ls = {
			-- 	init_options = {
			-- 		hostInfo = "neovim",
			-- 		maxTsServerMemory = 2048,
			-- 		-- preferences = {
			-- 		--     importModuleSpecifierPreference = "relative",
			-- 		-- },
			-- 	},
			-- filetypes = {
			-- 	"javascript",
			-- 	"javascriptreact",
			-- 	"javascript.jsx",
			-- 	"typescript",
			-- 	"typescriptreact",
			-- 	"typescript.tsx",
			-- 	"vue",
			-- 	"svelte",
			-- 	-- "astro",
			-- },
			-- },

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
		}

		local helpers = require("leiswatch.helpers")
		local lspconfig = require("lspconfig")
		require("lspconfig.ui.windows").default_options.border = "single"

		local eslint = require("nvim-eslint")
		local oxlint = require("nvim-oxlint")

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

		local mason_config = require("leiswatch.lsp.mason_config")

		-- local handlers = {
		-- 	function(server_name)
		-- 		if not servers[server_name] then
		-- 			return
		-- 		end

		-- 		local server = servers[server_name]
		-- 		server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
		-- 		lspconfig[server_name].setup(server)
		-- 	end,
		-- }

		require("mason").setup({
			max_concurrent_installers = 1,
			ui = {
				border = "single",
				height = 0.8,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = mason_config.ensure_installed_tools,
			auto_update = false,
			run_on_start = true,
			start_delay = 10000, -- 10 seconds delay
			debounce_hours = 5, -- at least 5 hours between attempts to install/update
		})

		require("mason-lspconfig").setup({
			-- handlers = handlers,
			ensure_installed = mason_config.ensure_installed,
			automatic_installation = true,
		})

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
		}

		require("lspconfig.configs").vtsls = require("vtsls").lspconfig

		oxlint.setup({
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"vue",
				"svelte",
				-- "astro",
			},
		})

		eslint.setup({
			root_dir = function(bufnr)
				local dir = eslint.resolve_git_dir(bufnr) or vim.uv.cwd()
				return dir
			end,
			capabilities = capabilities,
			settings = {
				validate = "on",
				useESLintClass = true,
				useFlatConfig = helpers.use_eslint_flat_config,
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
		})

		for server_name, _ in pairs(servers) do
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			server.handlers = handlers
			lspconfig[server_name].setup(server)
		end

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
	end,
}
