local conform = require("conform")
local opts = { noremap = true, silent = true }

local format = function()
	local filetype = vim.bo.filetype

	if
		vim.fn.exists(":EslintFixAll") ~= 0
		and (
			filetype == "javascript"
			or filetype == "typescript"
			or filetype == "typescriptreact"
			or filetype == "javascriptreact"
			or filetype == "astro"
			or filetype == "vue"
		)
	then
		vim.api.nvim_command(":EslintFixAll")
	end

	conform.format({ timeout_ms = 2000, lsp_fallback = nil })
end

vim.keymap.set("n", "<leader>cf", format, opts)
