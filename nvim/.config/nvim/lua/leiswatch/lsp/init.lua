local helpers = require("leiswatch.helpers")

local M = {}

local function get_servers(schemastore)
	return {
		clangd = { capabilities = { offsetEncoding = { "utf-16" } } },
		astro = {},
		awk_ls = {},
		bashls = {},
		biome = {
			cmd = { helpers.find_executable({ "node_modules/.bin/biome" }, "biome"), "lsp-proxy" },
		},
		-- denols = {},
		dockerls = {},
		gopls = {},
		html = {},
		-- htmx = {},
		jsonls = {
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
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
					schemas = schemastore.yaml.schemas(),
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
			cmd = { "rustup", "run", "stable", "rust-analyzer" },
		},

		graphql = {
			filetypes = { "graphql" },
		},

		cssls = { filetypes = { "css", "less" } },
		somesass_ls = { filetypes = { "scss", "sass" } },
		cssmodules_ls = {},
		tailwindcss = {
			filetypes = { "templ" },
		},
		-- css_variables = {},

		stylelint_lsp = {
			filetypes = { "css", "less", "scss", "sugarss", "sass" },
			settings = {
				stylelintplus = {
					autoFixOnFormat = true,
					autoFixOnSave = false,
					validateOnSave = true,
					validateOnType = true,
				},
			},
		},
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
		oxlint = {
			cmd = { helpers.find_executable({ "node_modules/.bin/oxc_language_server" }, "oxc_language_server") },
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

		-- ts_ls = {
		-- 	init_options = {
		-- 		hostInfo = "neovim",
		-- 		maxTsServerMemory = 2048,
		-- 		-- preferences = {
		-- 		--     importModuleSpecifierPreference = "relative",
		-- 		-- },
		-- 	},
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
end

local mason_lsp = {
	"astro",
	"basedpyright",
	"bashls",
	"biome",
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
	"oxlint",
	"prismals",
	"rust_analyzer",
	"somesass_ls",
	"stylelint_lsp",
	"svelte",
	"tailwindcss",
	"taplo",
	"templ",
	"vtsls",
	"yamlls",
	"zls",
	-- "ts_ls",
	-- "htmx",
	-- "terraformls",
	-- "vuels",
	-- "emmet_ls",
}

local mason_tools = {
	"black",
	"clang-format",
	"dotenv-linter",
	"gofumpt",
	"goimports",
	"golangci-lint",
	"luacheck",
	"oxlint",
	"prettier",
	"pylint",
	"shellcheck",
	"shfmt",
	"stylua",
	"yamllint",
	"yapf",
	-- "prettierd",
	-- "selene",
	-- "stylelint",
	-- "jsonlint",
	-- "eslint_d",
}

M.get_servers = get_servers
M.mason_lsp = mason_lsp
M.mason_tools = mason_tools

return M
