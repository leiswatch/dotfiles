vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	-- title = "Hover",
	max_width = 120,
	max_height = 20,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	-- title = "Signature help",
	max_width = 120,
	max_height = 20,
})
