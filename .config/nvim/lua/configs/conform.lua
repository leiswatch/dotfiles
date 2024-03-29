require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		go = { "goimports", "gofumpt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		python = { "black", "yapf" },
		astro = { "prettier" },
		svelte = { "prettier" },
		vue = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javacriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		sass = { "prettier" },
		less = { "prettier" },
		yaml = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		["_"] = { "trim_whitespace" },
	},
})
