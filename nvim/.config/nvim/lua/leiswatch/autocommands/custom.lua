local auto_hl_group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true })
local hl_yank_group = vim.api.nvim_create_augroup("HighlightYank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = hl_yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "HighlightYank",
			timeout = 80,
		})
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

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	group = auto_hl_group,
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
			vim.schedule(function()
				vim.cmd.nohlsearch()
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = auto_hl_group,
	callback = function()
		if vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "help" then
			vim.schedule(function()
				vim.cmd.nohlsearch()
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"astro",
		"svelte",
		"css",
		"scss",
		"sass",
		"yaml",
	},
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	callback = function(buf)
		vim.keymap.set("n", "q", ":ccl<cr>", { buffer = buf.buf, silent = true, noremap = true, nowait = true })
		vim.keymap.set("n", "<ESC>", ":ccl<cr>", { buffer = buf.buf, silent = true, noremap = true })
	end,
})
