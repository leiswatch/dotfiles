local conform = require("conform")
local opts = { noremap = true, silent = true }

local format = function()
	local filetype = vim.bo.filetype
	local bufnr = vim.api.nvim_get_current_buf()

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

	if filetype == "css" or filetype == "scss" or filetype == "sass" or filetype == "less" then
		vim.lsp.buf.format({
			filter = function(client)
                vim.notify(client.name)
				return client.name == "stylelint-lsp"
			end,
			bufnr = bufnr,
			timeout_ms = 3000,
		})
	end

	conform.format({ timeout_ms = 3000, lsp_fallback = true, async = true })

	-- vim.notify("Conform formatted file")
end

vim.keymap.set("n", "<leader>f", format, opts)
