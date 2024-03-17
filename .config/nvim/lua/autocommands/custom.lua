local opts = { noremap = true, silent = true }
local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 80,
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
		-- "alpha",
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
		vim.o.colorcolumn = "0"
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>ccl<cr>", opts)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "DressingSelect" },
	callback = function()
		vim.b.matchup_matchparen_enabled = 0
		vim.b.matchup_matchparen_fallback = 0
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[setlocal formatoptions-=ro]])
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })
