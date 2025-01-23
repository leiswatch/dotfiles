return {
	"stevearc/conform.nvim",
	event = { "BufRead" },
	config = function()
		local helpers = require("leiswatch.helpers")

		require("conform").setup({
			default_format_opts = { lsp_format = "never" },
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				go = { "goimports", "gofmt" },
				templ = { "templ" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "black", "yapf" },

				html = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "never",
				},
				astro = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "eslint"
					end,
				},
				svelte = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "eslint"
					end,
				},
				vue = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "eslint"
					end,
				},

				javascript = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "eslint"
					end,
				},
				typescript = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "eslint"
					end,
				},
				javacriptreact = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "eslint"
					end,
				},
				typescriptreact = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "eslint"
					end,
				},

				css = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "stylelint_lsp"
					end,
				},
				scss = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "stylelint_lsp"
					end,
				},
				sass = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "stylelint_lsp"
					end,
				},
				less = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "stylelint_lsp"
					end,
				},
				json = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "jsonls"
					end,
				},
				jsonc = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "jsonls"
					end,
				},
				yaml = {
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "first",
					filter = function(client)
						return client.name == "yamlls"
					end,
				},
				bash = { "shfmt" },
				zsh = { "shfmt" },
				zig = { "zigfmt" },
				["*"] = { "trim_newlines", "trim_whitespace" },
			},
		})
	end,
}
