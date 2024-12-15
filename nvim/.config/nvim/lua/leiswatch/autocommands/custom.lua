local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "HighlightYank",
			timeout = 80,
		})
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>ccl<CR>", opts)
		vim.keymap.set("n", "<ESC>", "<cmd>ccl<CR>", opts)
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	desc = "auto resize splited windows",
	pattern = "*",
	callback = function()
		vim.cmd("tabdo wincmd =")
		require("fzf-lua").redraw()
	end,
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

-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "DressingSelect" },
-- 	callback = function()
-- 		vim.b.matchup_matchparen_enabled = 0
-- 		vim.b.matchup_matchparen_fallback = 0
-- 	end,
-- })
