local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "leiswatch.plugins",
	defaults = {
		lazy = false,
	},
	ui = {
		size = { width = 0.75, height = 0.75 },
		wrap = true,
		border = "single",
	},
	install = {
		missing = true,
		colorscheme = { "catppuccin" },
	},
	change_detection = {
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
})
