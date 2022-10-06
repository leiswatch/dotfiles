local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lspinfo",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "rounded" })
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lsp-installer",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "rounded" })
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "null-ls-info",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "rounded" })
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function()
		vim.schedule(function()
			vim.notify("mason-tool-installer has finished")
		end)
	end,
})

vim.cmd([[
	autocmd FileType alpha, lspinfo, lsp-installer, null-ls-info, NvimTree setl colorcolumn=0
]])
