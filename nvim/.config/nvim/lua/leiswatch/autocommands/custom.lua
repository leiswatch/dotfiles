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
	pattern = { "qf" },
	callback = function(buf)
		vim.opt_local.colorcolumn = ""
		vim.keymap.set("n", "q", function()
			vim.cmd.cclose()
			vim.cmd.lclose()
		end, { buffer = buf.buf, silent = true, noremap = true, nowait = true })
		vim.keymap.set("n", "<ESC>", function()
			vim.cmd.cclose()
			vim.cmd.lclose()
		end, { buffer = buf.buf, silent = true, noremap = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitsigns-blame" },
	callback = function(buf)
		local width = math.floor(vim.o.columns * 0.2)
		vim.cmd("vertical resize " .. tostring(width))

		vim.keymap.set("n", "q", function()
			vim.api.nvim_buf_delete(buf.buf, { force = true })
		end, { buffer = buf.buf, silent = true, noremap = true, nowait = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "oil", "neo-tree", "help", "grug-far", "fugitive" },
	callback = function()
		vim.opt_local.colorcolumn = ""
	end,
})
