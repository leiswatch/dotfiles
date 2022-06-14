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

vim.cmd([[
	augroup highlight_yank
			autocmd!
			au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
	augroup END

	autocmd FileType alpha, lspinfo, lsp-installer, null-ls-info, NvimTree  setl colorcolumn=0
]])
