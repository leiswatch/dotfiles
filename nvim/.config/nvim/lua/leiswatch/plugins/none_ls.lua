return {
	"nvimtools/none-ls.nvim",
	enabled = false,
	config = function()
		local none_ls = require("null-ls")

		none_ls.setup({
			sources = {
				-- Lua
				none_ls.builtins.formatting.stylua,

				-- Javascript/Typescript
				none_ls.builtins.formatting.prettier,

				-- Python
				none_ls.builtins.formatting.black,
				none_ls.builtins.formatting.yapf,
				none_ls.builtins.diagnostics.pylint,

				-- C/C++
				none_ls.builtins.formatting.clang_format,

				-- Bash/Zsh
				none_ls.builtins.formatting.shfmt,

				-- Go
				none_ls.builtins.formatting.goimports,
				none_ls.builtins.formatting.gofmt,
				none_ls.builtins.diagnostics.golangci_lint,

				-- YAML
				none_ls.builtins.diagnostics.yamllint,

				-- ZSH
				none_ls.builtins.diagnostics.zsh,

				-- Code Actions
				none_ls.builtins.code_actions.gitsigns,
			},
		})
	end,
}
