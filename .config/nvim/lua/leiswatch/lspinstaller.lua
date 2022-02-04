local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_buf_set_keymap

local on_attach = function(client, bufnr)

  map(bufnr, 'n', '<leader>cd', ':lua vim.diagnostic.open_float()<CR>', opts)
  map(bufnr, 'n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
  map(bufnr, 'n', ']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
  map(bufnr, 'n', '<leader>cds', ':lua vim.diagnostic.setloclist()<CR>', opts)
  map(bufnr, 'n', '<leader>cf', ':lua vim.lsp.buf.formatting()<CR>', opts)
  map(bufnr, "n", "<leader>cr", "<cmd>Lspsaga rename<cr>", opts)
  map(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  map(bufnr, "x", "<leader>ca", ":<c-u>Lspsaga range_code_action<cr>", opts)
  map(bufnr, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
  map(bufnr, "n", "<leader>co", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  map(bufnr, "n", "<leader>cj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  map(bufnr, "n", "<leader>ck", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
  map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)
  map(bufnr, 'n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  map(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  map(bufnr, 'n', '<leder>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  map(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
end

lsp_installer.on_server_ready(function(server)
    local server_opts = {
      capabilities = capabilities,
      on_attach = on_attach
    }

    if server.name == "tsserver" then
      server_opts.init_options = require("nvim-lsp-ts-utils").init_options;
      server_opts.on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- if false will avoid organizing imports
            always_organize_imports = false,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},

            -- inlay hints
            auto_inlay_hints = true,
            inlay_hints_highlight = "Comment",
            inlay_hints_priority = 200, -- priority of the hint extmarks
            inlay_hints_throttle = 150, -- throttle the inlay hint request
            inlay_hints_format = { -- format options for individual hint kind
                Type = {},
                Parameter = {},
                Enum = {},
                -- Example format customization for `Type` kind:
                -- Type = {
                --     highlight = "Comment",
                --     text = function(text)
                --         return "->" .. text:sub(2)
                --     end,
                -- },
            },

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = true,
            watch_dir = nil,
        })

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        map(bufnr, "n", "<leader>ts", ":TSLspOrganize<cr>", opts)
        map(bufnr, "n", "<leader>tr", ":TSLspRenameFile<cr>", opts)
        map(bufnr, "n", "<leader>ti", ":TSLspImportAll<cr>", opts)
    end
  end

    if server.name == "eslint" then
      server_opts.settings = {
        codeActionOnSave = {
          enable = true,
          mode = "all"
        },
        useESLintClass = true,
        format = true,
        packageManager = "yarn",
      }
    end

    if server.name == "stylelint_lsp" then
      server_opts.filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" }
      server_opts.settings = {
        stylelintplus = {
          autoFixOnFormat = true,
          autoFixOnSave = true,
          cssInJs = false,
          validateOnSave = true,
          validateOnType = true,
        }
      }
    end

    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(server_opts)
end)
