local opts = { noremap = true, silent = true }

local neoformat = function()
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

		if vim.fn.exists(":Neoformat") ~= 0 then
			vim.api.nvim_command(":Neoformat")
		end

		vim.notify("Buffer formatted!")
	elseif vim.fn.exists(":Neoformat") ~= 0 then
		vim.api.nvim_command(":Neoformat")
		vim.notify("Buffer formatted!")
	else
		vim.notify("No formatter found!")
	end
end

-- vim.keymap.set("n", "<leader>cf", "<cmd>:Neoformat<CR>", opts)
vim.keymap.set("n", "<leader>cf", neoformat, opts)
