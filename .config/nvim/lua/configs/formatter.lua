-- Utilities for creating configurations
local util = require("formatter.util")

local stylelint_format = function()
	return {
		exe = "stylelint",
		args = {
			"--fix",
			"--stdin",
			"--stdin-filename",
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
		try_node_modules = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = false,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		typescript = {
			require("formatter.filetypes.typescript").eslint_d,
			require("formatter.filetypes.typescript").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").eslint_d,
			require("formatter.filetypes.typescriptreact").prettierd,
		},
		javascript = {
			require("formatter.filetypes.javascript").eslint_d,
			require("formatter.filetypes.javascript").prettierd,
		},
		javacriptreact = {
			require("formatter.filetypes.javascriptreact").eslint_d,
			require("formatter.filetypes.javascriptreact").prettierd,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
			require("formatter.filetypes.go").goimports,
		},
		python = {
			require("formatter.filetypes.python").yapf,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		astro = {
			require("formatter.filetypes.typescript").eslint_d,
			require("formatter.filetypes.typescript").prettierd,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},
		json = {
			require("formatter.filetypes.html").prettierd,
		},
		jsonc = {
			require("formatter.filetypes.json").prettierd,
		},
		prisma = {
			require("formatter.filetypes.typescript").prettierd,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettierd,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		scss = {
			stylelint_format,
			require("formatter.filetypes.css").prettierd,
		},
		css = {
			stylelint_format,
			require("formatter.filetypes.css").prettierd,
		},
		sass = {
			stylelint_format,
			require("formatter.filetypes.css").prettierd,
		},
		less = {
			stylelint_format,
			require("formatter.filetypes.css").prettierd,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
