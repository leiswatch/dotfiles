local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)

    local opts = {
        capabilities = capabilities,
    }

    if server.name == "tsserver" then
	opts.on_attach = function(client, bufnr)
        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

	 ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers indicate higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = true,
            eslint_opts = {},

            -- formatting
            enable_formatting = true,
            formatter = "eslint_d",
            formatter_opts = {},

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = true,
            watch_dir = nil,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        }

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")

        -- no default maps, so you may want to define some here
        local local_opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", local_opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", local_opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", local_opts)
    end
	end
    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

