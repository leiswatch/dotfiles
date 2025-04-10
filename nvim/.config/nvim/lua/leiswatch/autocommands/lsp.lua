local fzflua = require("fzf-lua")
local helpers = require("leiswatch.helpers")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local keymap_opts = vim.tbl_extend("force", helpers.keymap_opts, { buffer = event.buf })

		-- local diagnostic_opts = { border = "single", max_width = 100, header = "", source = false, scope = "line" }
		local diagnostic_opts = { border = "single", header = "", source = true, scope = "line" }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
		vim.keymap.set("n", "gl", vim.lsp.buf.references, keymap_opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
		vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, keymap_opts)
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.document_symbol, keymap_opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "single",
			})
		end, keymap_opts)
		vim.keymap.set("n", "<leader>k", function()
			vim.lsp.buf.signature_help({
				border = "single",
			})
		end, keymap_opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymap_opts)
		vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, keymap_opts)
		vim.keymap.set({ "v", "n" }, "<leader>cf", function(bufnr)
			vim.lsp.buf.format({ timeout_ms = 3000, bufnr = bufnr })
		end, keymap_opts)
		-- vim.keymap.set({ "v", "n" }, "<leader>ca", fzflua.lsp_code_actions, keymap_opts)

		vim.keymap.set("n", "<leader>e", function()
			vim.diagnostic.open_float(diagnostic_opts)
		end, keymap_opts)

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev({ float = diagnostic_opts })
			-- vim.diagnostic.jump({
			-- 	count = -1,
			-- 	float = diagnostic_opts,
			-- })
		end, keymap_opts)

		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next({ float = diagnostic_opts })
			-- vim.diagnostic.jump({
			-- 	count = 1,
			-- 	float = diagnostic_opts,
			-- })
		end, keymap_opts)

		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, keymap_opts)

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
