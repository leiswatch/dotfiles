vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { noremap = true, silent = true, buffer = event.buf }
		-- local diagnostic_opts = { border = "rounded", max_width = 100, header = "", source = false, scope = "line" }
		local diagnostic_opts = { border = "rounded", header = "", source = false, scope = "line" }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gl", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.document_symbol, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "rounded",
			})
		end, opts)
		vim.keymap.set("n", "<leader>k", function()
			vim.lsp.buf.signature_help({
				border = "rounded",
			})
		end, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set({ "v", "n" }, "<leader>cf", function(bufnr)
			vim.lsp.buf.format({ timeout_ms = 3000, bufnr = bufnr })
		end, opts)
		-- vim.keymap.set({ "v", "n" }, "<leader>ca", function()
		-- 	fzflua.lsp_code_actions({
		-- 		winopts = {
		-- 			relative = "cursor",
		-- 			row = 1.01,
		-- 			col = 0,
		-- 			height = 0.3,
		-- 			width = 0.3,
		-- 			preview = { hidden = "hidden" },
		-- 		},
		-- 	})
		-- end, opts)

		vim.keymap.set("n", "<leader>e", function()
			vim.diagnostic.open_float(diagnostic_opts)
		end, opts)

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({
				count = -1,
				float = diagnostic_opts,
			})
		end, opts)

		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({
				count = 1,
				float = diagnostic_opts,
			})
		end, opts)

		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

		-- vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
		--     if not require("noice.lsp").scroll(4) then
		--         return "<c-f>"
		--     end
		-- end, { silent = true, expr = true })

		-- vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
		--     if not require("noice.lsp").scroll(-4) then
		--         return "<c-b>"
		--     end
		-- end, { silent = true, expr = true })

		-- local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- if client and client.server_capabilities.documentHighlightProvider then
		-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		-- 		buffer = event.buf,
		-- 		callback = vim.lsp.buf.document_highlight,
		-- 	})

		-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		-- 		buffer = event.buf,
		-- 		callback = vim.lsp.buf.clear_references,
		-- 	})
		-- end
	end,
})
