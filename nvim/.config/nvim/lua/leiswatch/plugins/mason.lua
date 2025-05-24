local lsp = require("leiswatch.lsp")

return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = lsp.mason_tools,
				auto_update = false,
				run_on_start = true,
				start_delay = 1000, -- 10 seconds delay
				debounce_hours = 5, -- at least 5 hours between attempts to install/update
			},
		},
		{
			"mason-org/mason.nvim",
			opts = {
				max_concurrent_installers = 3,
				ui = {
					border = "single",
					height = 0.8,
					backdrop = 100,
					icons = {
						package_installed = " ",
						package_pending = " ",
						package_uninstalled = " ",
					},
				},
			},
		},
	},
	opts = {
		automatic_enable = false,
		ensure_installed = lsp.mason_lsp,
	},
}
