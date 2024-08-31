local servers = {
	clangd = {
		{ offsetEncoding = { "utf-16" } },
	},
	astro = {},
	awk_ls = {},
	bashls = {},
	dockerls = {},
	gopls = {
		settings = {
			gopls = {
				["ui.inlayhint.hints"] = {
					compositeLiteralFields = true,
					constantValues = true,
					parameterNames = true,
				},
			},
		},
	},
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

				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "Lua 5.4",
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

	cssmodules_ls = {},
	tailwindcss = {},
	-- capabilities = {
	-- 	definitionProvider = false,
	-- },
	-- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },

	graphql = {
		filetypes = { "graphql" },
	},

	cssls = {
		filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" },
	},
	somesass_ls = {},

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
			experimental = {
				useFlatConfig = false,
			},
			runtime = "node",
			format = true,
			run = "onType",
			validate = "on",
			workingDirectories = {
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
	vtsls = {
		settings = {
			vtsls = {
				autoUseWorkspaceTsdk = true,
			},
			typescript = {
				preferGoToSourceDefinition = true,
				tsserver = {
					maxTsServerMemory = 8192,
				},
			},
			javascript = {
				preferGoToSourceDefinition = true,
			},
		},
	},
	zls = {},

	-- tsserver = {
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

	-- "denols",
}

return servers
