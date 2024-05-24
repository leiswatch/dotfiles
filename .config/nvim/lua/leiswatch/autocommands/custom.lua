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
		"harpoon",
		"TelescopePrompt",
		"mason",
		"oil",
	},
	callback = function()
		vim.o.relativenumber = false
		vim.o.colorcolumn = "0"
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf" },
	callback = function()
		vim.keymap.set("n", "q", "<CMD>ccl<CR>", opts)
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

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	desc = "auto resize splited windows",
	pattern = "*",
	command = "tabdo wincmd =",
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
			vim.schedule(function()
				vim.cmd.nohlsearch()
			end)
		end
	end,
})
