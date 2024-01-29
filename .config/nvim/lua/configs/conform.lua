require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "yapf" },
		astro = { "prettierd" },
		vue = { "prettierd" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javacriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
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
