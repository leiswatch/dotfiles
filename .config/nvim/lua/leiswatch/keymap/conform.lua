local conform = require("conform")
local opts = { noremap = true, silent = true }

local function contains(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local eslint_filetypes = {
	"javascript",
	"typescript",
	"typescriptreact",
	"javascriptreact",
	"astro",
	"vue",
}

local function stylelint_filter(client)
	return client.name == "stylelint_lsp"
end

local lsp_fallback = setmetatable({
	css = { "always", "stylelint_lsp", stylelint_filter },
	scss = { "always", "stylelint_lsp", stylelint_filter },
	sass = { "always", "stylelint_lsp", stylelint_filter },
	less = { "always", "stylelint_lsp", stylelint_filter },
}, {
	__index = function()
		return { false, nil, nil }
	end,
})

local format = function()
	local filetype = vim.bo.filetype
	local bufnr = vim.api.nvim_get_current_buf()

	if vim.fn.exists(":EslintFixAll") ~= 0 and contains(eslint_filetypes, filetype) then
		vim.api.nvim_command(":EslintFixAll")
	end

    conform.format({
		timeout_ms = 2000,
		lsp_fallback = lsp_fallback[vim.bo[bufnr].filetype][1],
		async = false,
		name = lsp_fallback[vim.bo[bufnr].filetype][2],
		filter = lsp_fallback[vim.bo[bufnr].filetype][3],
	})
end

vim.keymap.set({ "n", "v" }, "<C-i>", format, opts)
