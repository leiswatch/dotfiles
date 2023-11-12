vim.g.lspTimeoutConfig = {
	stopTimeout = 1000 * 60, -- ms, timeout before stopping all LSPs
	startTimeout = 1000 * 10, -- ms, timeout before restart
	silent = true, -- true to suppress notifications
	filetypes = { ignore = {} },
}
