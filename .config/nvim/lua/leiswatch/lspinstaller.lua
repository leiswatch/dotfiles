local lsp_installer = require("nvim-lsp-installer")

local servers = {
	"cssls",
	"cssmodules_ls",
	"dockerls",
	-- "eslint",
	"emmet_ls",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"tsserver",
	"sumneko_lua",
	"pyright",
	"stylelint_lsp",
	"yamlls",
	"rust_analyzer",
	"dockerls",
}

local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

-- local handlers = {
-- 	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
-- 	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
-- }

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local opts = {
	noremap = true,
	silent = true,
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>eq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({ border = 'rounded' })<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gi",
		"<cmd>lua vim.lsp.buf.implementation({ border = 'rounded' })<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<C-k>",
		"<cmd>lua vim.lsp.buf.signature_help({ border = 'rounded' })<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>", opts)

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	-- vim.api.nvim_create_autocmd("CursorHold", {
	-- 	buffer = bufnr,
	-- 	callback = function()
	-- 		local cursor_opts = {
	-- 			focusable = false,
	-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
	-- 			border = "rounded",
	-- 			source = "always",
	-- 			prefix = "● ",
	-- 			scope = "cursor",
	-- 		}
	-- 		vim.diagnostic.open_float(nil, cursor_opts)
	-- 	end,
	-- })
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local enhance_server_opts = {
	["sumneko_lua"] = function(curr_opts)
		curr_opts.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		}
	end,
	-- ["eslint"] = function(curr_opts)
	-- 	curr_opts.settings = {
	-- 		cmd = { "eslint_d", "--stdio" },
	-- 		codeActionOnSave = {
	-- 			enable = true,
	-- 			mode = "all",
	-- 		},
	-- 		format = true,
	-- 		run = "onType",
	-- 		useESLintClass = true,
	-- 		validate = "on",
	-- 	}
	-- end,
	["tsserver"] = function(curr_opts)
		require("typescript").setup({
			server = curr_opts,
		})
	end,
	-- ["tsserver"] = function(curr_opts)
	-- 	curr_opts.settings = {
	-- 		init_options = require("nvim-lsp-ts-utils").init_options,
	-- 	}
	-- 	curr_opts.on_attach = function(client, bufnr)
	-- 		local ts_utils = require("nvim-lsp-ts-utils")

	-- 		-- defaults
	-- 		ts_utils.setup({
	-- 			debug = false,
	-- 			disable_commands = false,
	-- 			enable_import_on_completion = true,

	-- 			-- import all
	-- 			import_all_timeout = 5000, -- ms
	-- 			-- lower numbers = higher priority
	-- 			import_all_priorities = {
	-- 				same_file = 1, -- add to existing import statement
	-- 				local_files = 2, -- git files or files with relative path markers
	-- 				buffer_content = 3, -- loaded buffer content
	-- 				buffers = 4, -- loaded buffer names
	-- 			},
	-- 			import_all_scan_buffers = 100,
	-- 			import_all_select_source = false,
	-- 			-- if false will avoid organizing imports
	-- 			always_organize_imports = false,

	-- 			-- filter diagnostics
	-- 			filter_out_diagnostics_by_severity = {},
	-- 			filter_out_diagnostics_by_code = {},

	-- 			-- inlay hints
	-- 			auto_inlay_hints = true,
	-- 			inlay_hints_highlight = "Comment",
	-- 			inlay_hints_priority = 200, -- priority of the hint extmarks
	-- 			inlay_hints_throttle = 150, -- throttle the inlay hint request
	-- 			inlay_hints_format = { -- format options for individual hint kind
	-- 				Type = {},
	-- 				Parameter = {},
	-- 				Enum = {},
	-- 				-- Example format customization for `Type` kind:
	-- 				-- Type = {
	-- 				--     highlight = "Comment",
	-- 				--     text = function(text)
	-- 				--         return "->" .. text:sub(2)
	-- 				--     end,
	-- 				-- },
	-- 			},

	-- 			-- update imports on file move
	-- 			update_imports_on_move = false,
	-- 			require_confirmation_on_move = false,
	-- 			watch_dir = nil,
	-- 		})

	-- 		-- required to fix code action ranges and filter diagnostics
	-- 		ts_utils.setup_client(client)

	-- 		-- no default maps, so you may want to define some here
	-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gs", ":TSLspOrganize<CR>", opts)
	-- 		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
	-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", ":TSLspImportAll<CR>", opts)
	-- 	end
	--	end,
	["stylelint_lsp"] = function(curr_opts)
		curr_opts.settings = {
			stylelintplus = {
				autoFixOnSave = false,
				autoFixOnFormat = true,
			},
		}
		curr_opts.filetypes = { "css", "less", "sass", "scss", "sugarss", "vue" }
	end,
}

lsp_installer.on_server_ready(function(server)
	local server_opts = { on_attach = on_attach, capabilities = capabilities }

	if enhance_server_opts[server.name] then
		enhance_server_opts[server.name](server_opts)
	end

	server:setup(server_opts)
end)
