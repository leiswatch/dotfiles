require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "yapf" },
		astro = { "prettier" },
		vue = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javacriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = {
			"stylelint",
			"prettier",
		},
		scss = {
			"stylelint",
			"prettier",
		},
		sass = {
			"stylelint",
			"prettier",
		},
		less = {
			"stylelint",
			"prettier",
		},
		yaml = { "prettier" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
		json = { "prettier" },
		jsonc = { "prettier" },
		go = { "goimports", "gofumpt" },
		["_"] = { "trim_whitespace" },
	},
})
