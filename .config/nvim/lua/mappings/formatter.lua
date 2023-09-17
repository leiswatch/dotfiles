local opts = { noremap = true, silent = true }

local format = function()
	local filetype = vim.bo.filetype

	if
		filetype == "javascript"
		or filetype == "typescript"
		or filetype == "typescriptreact"
		or filetype == "javascriptreact"
		or filetype == "astro"
		or filetype == "vue"
	then
		if vim.fn.exists(":EslintFixAll") ~= 0 then
			vim.api.nvim_command(":EslintFixAll")
		end

		if vim.fn.exists(":FormatWrite") ~= 0 then
			vim.api.nvim_command(":FormatWrite")
      vim.notify("Buffer formatted!")
		end
	elseif vim.fn.exists(":FormatWrite") ~= 0 then
		vim.api.nvim_command(":FormatWrite")
    vim.notify("Buffer formatted!")
	else
    vim.notify("No formatter found!")
	end
end

-- vim.keymap.set("n", "<leader>cf", "<cmd>FormatWrite<CR>", opts)
vim.keymap.set("n", "<leader>cf", format, opts)
