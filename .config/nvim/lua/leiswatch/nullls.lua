local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

null_ls.setup({
	debug = false,
	update_in_insert = false,
	sources = {
		-- Code Actions
		code_actions.eslint_d.with({
			filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			--[[ prefer_local = "node_modules/.bin", ]]
		}),

		-- Diagnostics
		diagnostics.pylint,
		diagnostics.jsonlint.with({
			filetypes = { "json" },
		}),
		--[[ diagnostics.eslint_d.with({ ]]
		--[[ 	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, ]]
		--[[ prefer_local = "node_modules/.bin", ]]
		--[[ }), ]]
		diagnostics.golangci_lint,

		-- Formatters
		formatting.eslint_d.with({
			filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			--[[ prefer_local = "node_modules/.bin", ]]
		}),
		formatting.stylelint.with({
			filetypes = { "scss", "less", "css", "sass" },
			prefer_local = "node_modules/.bin",
		}),
		formatting.yapf,
		formatting.gofmt,
		formatting.rustfmt,
		formatting.stylua,
		-- formatting.fixjson,
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"json",
				"yaml",
			},
			prefer_local = "node_modules/.bin",
		}),
	},
	on_attach = on_attach,
})
