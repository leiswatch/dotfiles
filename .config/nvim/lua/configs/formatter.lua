local util = require("formatter.util")

local stylelint_format = function()
	return {
		exe = "stylelint",
		args = {
			"--fix",
			"--stdin-filename",
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
		try_node_modules = true,
	}
end

require("formatter").setup({
	logging = false,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		typescript = {
			-- require("formatter.defaults.eslint_d"),
			require("formatter.defaults.prettierd"),
		},
		typescriptreact = {
			-- require("formatter.defaults.eslint_d"),
			require("formatter.defaults.prettierd"),
		},
		javascript = {
			-- require("formatter.defaults.eslint_d"),
			require("formatter.defaults.prettierd"),
		},
		javacriptreact = {
			-- require("formatter.defaults.eslint_d"),
			require("formatter.defaults.prettierd"),
		},
		go = {
      require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofmt,
		},
		python = {
			require("formatter.filetypes.python").yapf,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		astro = {
			-- require("formatter.defaults.eslint_d"),
			require("formatter.defaults.prettierd"),
		},
		html = {
			require("formatter.defaults.prettier"),
		},
		json = {
			require("formatter.defaults.prettierd"),
		},
		jsonc = {
			require("formatter.defaults.prettierd"),
		},
		prisma = {
			require("formatter.defaults.prettierd"),
		},
		yaml = {
			require("formatter.defaults.prettierd"),
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		scss = {
			stylelint_format,
			require("formatter.defaults.prettierd"),
		},
		css = {
			stylelint_format,
			require("formatter.defaults.prettierd"),
		},
		sass = {
			stylelint_format,
			require("formatter.defaults.prettierd"),
		},
		less = {
			stylelint_format,
			require("formatter.defaults.prettierd"),
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
