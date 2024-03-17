local lsp_formatting = function(bufnr)
	local filetype = vim.bo.filetype

	if
		vim.fn.exists(":EslintFixAll") ~= 0
		and (
			filetype == "javascript"
			or filetype == "typescript"
			or filetype == "typescriptreact"
			or filetype == "javascriptreact"
			or filetype == "astro"
			or filetype == "vue"
		)
	then
		vim.api.nvim_command(":EslintFixAll")
	end

	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls" or client.name == "stylelint_lsp" or client.name == "rust_analyzer"
		end,
		bufnr = bufnr,
		timeout_ms = 2000,
		async = false,
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { noremap = true, silent = true, buffer = ev.buf }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gl", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>lt", require("telescope.builtin").lsp_type_definitions, opts)
		vim.keymap.set("n", "<leader>ld", require("telescope.builtin").lsp_document_symbols, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>lf", lsp_formatting, opts)

		-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set("n", "<space>wl", function()
		-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- vim.keymap.set("n", "<space>f", function()
		-- 	vim.lsp.buf.format({ async = true })
		-- end, opts)

		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "gl", vim.lsp.buf.references, opts)
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set("n", "<leader>wl", function()
		-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)

		-- vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
		-- vim.keymap.set("n", "<leader>lr", require("telescope.builtin").lsp_references, opts)
		-- vim.keymap.set("n", "<leader>li", require("telescope.builtin").lsp_implementations, opts)
	end,
})
