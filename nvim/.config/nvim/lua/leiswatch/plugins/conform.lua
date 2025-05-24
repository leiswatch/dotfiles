return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<C-i>",
			function()
				require("conform").format({
					timeout_ms = 3000,
					async = true,
					quiet = false,
				})
			end,
			{ noremap = true, silent = true },
		},
	},
	opts = {
		formatters = {
			["biome-check"] = {
				require_cwd = true,
			},
		},
		default_format_opts = {
			lsp_format = "never",
		},
		log_level = vim.log.levels.DEBUG,
		notify_on_error = true,
		notify_no_formatters = true,
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			go = { "goimports", "gofmt" },
			templ = { "templ" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "black", "yapf" },
			zig = { "zigfmt" },

			html = { "prettier", stop_after_first = true },
			astro = {
				"prettier",
				lsp_format = "first",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			svelte = {
				"prettier",
				lsp_format = "first",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			vue = {
				"prettier",
				lsp_format = "first",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			javascript = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			typescript = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			javascriptreact = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			typescriptreact = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			css = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			scss = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			sass = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			less = {
				"biome-check",
				"prettier",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			json = { "biome-check", "prettier", stop_after_first = true },
			jsonc = { "biome-check", "prettier", stop_after_first = true },
			graphql = { "biome-check", "prettier", stop_after_first = true },

			yaml = { "prettier" },
			markdown = { "prettier" },

			bash = { "shfmt" },
			zsh = { "shfmt" },

			["_"] = { "trim_newlines", "trim_whitespace" },
		},
	},
}
