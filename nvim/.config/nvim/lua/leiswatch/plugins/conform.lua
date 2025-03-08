return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<C-i>",
			function()
				local bufnr = vim.api.nvim_get_current_buf()

				require("conform").format({
					timeout_ms = 3000,
					async = true,
					bufnr = bufnr,
				})
			end,
			{ noremap = true, silent = true },
		},
	},
	opts = {
		default_format_opts = {
			lsp_format = "never",
		},
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
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
			},
			astro = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			svelte = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			vue = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "eslint"
				end,
			},

			javascript = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			typescript = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			javacriptreact = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "eslint"
				end,
			},
			typescriptreact = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "eslint"
				end,
			},

			css = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			scss = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			sass = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			less = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "first",
				filter = function(client)
					return client.name == "stylelint_lsp"
				end,
			},
			json = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "jsonls"
				end,
			},
			jsonc = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "jsonls"
				end,
			},
			yaml = {
				"prettier",
				"prettierd",
				stop_after_first = true,
				lsp_format = "never",
				filter = function(client)
					return client.name == "yamlls"
				end,
			},
			bash = { "shfmt" },
			zsh = { "shfmt" },
			zig = { "zigfmt" },
			["*"] = { "trim_newlines", "trim_whitespace" },
		},
	},
}
