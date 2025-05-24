return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	enabled = false,
	opts = function()
		local null_ls = require("null-ls")

		return {
			sources = {
				-- Python
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.yapf,

				-- Go
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofmt,

				-- YAML
				null_ls.builtins.diagnostics.yamllint,

				-- Bash/ZSH
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.diagnostics.zsh,

				-- Lua
				null_ls.builtins.formatting.stylua,

				-- C/C++
				null_ls.builtins.formatting.clang_format,

				-- JS/TS
				null_ls.builtins.formatting.prettierd,
				-- require("none-ls.formatting.eslint_d"),
				-- require("none-ls.diagnostics.eslint_d"),
				-- require("none-ls.code_actions.eslint_d"),

				require("none-ls.formatting.trim_newlines"),
				require("none-ls.formatting.trim_whitespace"),
			},
		}
	end,
}
