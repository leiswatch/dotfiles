local helpers = require("leiswatch.helpers")
-- local helpers = require("leiswatch.helpers")

-- local eslint_filetypes = {
-- 	"javascript",
-- 	"typescript",
-- 	"typescriptreact",
-- 	"javascriptreact",
-- 	"astro",
-- 	"vue",
-- }

local format = function(bufnr)
	local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

	-- if vim.fn.exists(":EslintFixAll") ~= 0 and helpers.contains(eslint_filetypes, filetype) then
	-- 	vim.cmd.EslintFixAll()
	-- end

	require("conform").format({
		timeout_ms = 3000,
		async = false,
		bufnr = bufnr,
	})
end

vim.keymap.set({ "n", "v" }, "<C-i>", format, helpers.keymap_opts)
