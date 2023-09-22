require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "yapf" },
		astro = { "prettierd" },
		javascript = { "eslint_d", "prettierd" },
		typescript = { "eslint_d", "prettierd" },
		javacriptreact = { "eslint_d", "prettierd" },
		typescriptreact = { "eslint_d", "prettierd" },
		css = {
			"stylelint",
			"prettierd",
		},
		scss = {
			"stylelint",
			"prettierd",
		},
		sass = {
			"stylelint",
			"prettierd",
		},
		less = {
			"stylelint",
			"prettierd",
		},
		yaml = { "prettierd" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		go = { "goimports", "gofumpt" },
		["_"] = { "trim_whitespace" },
	},
})
