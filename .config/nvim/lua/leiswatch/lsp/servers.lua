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
	htmx = {},
	jsonls = {},
	prismals = {},
	pyright = {},
	svelte = {},
	templ = {},
	yamlls = {},

	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},

				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "Lua 5.1",
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						-- Depending on the usage, you might want to add additional paths here.
						-- "${3rd}/luv/library"
						-- "${3rd}/busted/library",
					},
					-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
					-- library = vim.api.nvim_get_runtime_file("", true)
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
			-- workingDirectories = {
			-- 	mode = "location",
			-- },
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

	tsserver = {
		init_options = {
			hostInfo = "neovim",
			maxTsServerMemory = 2048,
			-- preferences = {
			--     importModuleSpecifierPreference = "relative",
			-- },
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

	-- tailwindcss = {},
	-- "denols",
}

return servers
