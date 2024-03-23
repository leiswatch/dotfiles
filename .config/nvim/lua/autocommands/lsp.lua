-- local function contains(tab, val)
-- 	for _, value in ipairs(tab) do
-- 		if value == val then
-- 			return true
-- 		end
-- 	end

-- 	return false
-- end

-- local clients = {
-- 	"null-ls",
-- 	"eslint",
-- 	"stylelint_lsp",
--     "rust_analyzer",
-- }

-- local eslint_filetypes = {
-- 	"javascript",
-- 	"typescript",
-- 	"typescriptreact",
-- 	"javascriptreact",
-- 	"astro",
-- 	"vue",
-- }

-- local lsp_formatting = function(bufnr)
-- 	if vim.fn.exists(":EslintFixAll") ~= 0 and contains(eslint_filetypes, vim.bo.filetype) then
-- 		vim.api.nvim_command(":EslintFixAll")
-- 	end

-- 	vim.lsp.buf.format({
-- 		filter = function(client)
-- 			return contains(clients, client.name)
-- 		end,
-- 		bufnr = bufnr,
-- 		timeout_ms = 2000,
-- 		async = false,
-- 	})
-- end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { noremap = true, silent = true, buffer = event.buf }

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
		-- vim.keymap.set("n", "<C-i>", lsp_formatting, opts)

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
