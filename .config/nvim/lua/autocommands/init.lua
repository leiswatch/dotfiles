local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lspinfo",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "single" })
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "null-ls-info",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "single" })
		vim.opt.colorcolumn = ""
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"alpha",
		"lspinfo",
		"lsp-installer",
		"null-ls-info",
		"NvimTree",
		"buffer_manager",
		"harpoon",
		"TelescopePrompt",
		"mason",
	},
	callback = function()
		vim.o.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"alpha",
		"lspinfo",
		"lsp-installer",
		"null-ls-info",
		"NvimTree",
		"buffer_manager",
		"harpoon",
		"TelescopePrompt",
		"mason",
	},
	callback = function()
		vim.o.colorcolumn = "0"
	end,
})
