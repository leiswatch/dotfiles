local opts = { noremap = true, silent = true }
local helpers = require("leiswatch.helpers")

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

local function json_filter(client)
	return client.name == "jsonls"
end

local function eslint_filter(client)
	return client.name == "eslint"
end

local lsp_fallback = setmetatable({
	css = { "last", "stylelint_lsp", stylelint_filter },
	scss = { "last", "stylelint_lsp", stylelint_filter },
	sass = { "last", "stylelint_lsp", stylelint_filter },
	less = { "last", "stylelint_lsp", stylelint_filter },
	json = { "last", "jsonls", json_filter },
	jsonc = { "last", "jsonls", json_filter },
	javascript = { "first", "eslint", eslint_filter },
	typescript = { "first", "eslint", eslint_filter },
	javascriptreact = { "first", "eslint", eslint_filter },
	typescriptreact = { "first", "eslint", eslint_filter },
	["javscript.jsx"] = { "first", "eslint", eslint_filter },
	["typescript.tsx"] = { "first", "eslint", eslint_filter },
	astro = { "first", "eslint", eslint_filter },
	svelte = { "first", "eslint", eslint_filter },
	vue = { "first", "eslint", eslint_filter },
}, {
	__index = function()
		return { false, nil, nil }
	end,
})

local format = function()
	local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })

	-- if vim.fn.exists(":EslintFixAll") ~= 0 and helpers.contains(eslint_filetypes, filetype) then
	-- 	vim.api.nvim_cmd({ cmd = "EslintFixAll" }, {})
	-- end

	require("conform").format({
		timeout_ms = 3000,
		async = false,
		lsp_format = lsp_fallback[filetype][1],
		name = lsp_fallback[filetype][2],
		filter = lsp_fallback[filetype][3],
	})
end

vim.keymap.set({ "n", "v" }, "<C-i>", format, opts)
