local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap = true, silent = true }


local on_attach = function(client, bufnr)
  local map = vim.api.nvim_buf_set_keymap

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

    if server.name == "efm" then
      local stylelint = {
        lintCommand = 'stylelint --stdin --stdin-filename ${INPUT} --formatter compact',
        lintIgnoreExitCode = true,
        lintStdin = true,
        lintFormats = {
          '%f: line %l, col %c, %tarning - %m',
          '%f: line %l, col %c, %trror - %m',
        },
        formatCommand = 'stylelint --fix --stdin --stdin-filename ${INPUT}',
        formatStdin = true,
      }

      server_opts.init_options = {
        documentFormatting = true
      };
      server_opts.filetypes = {
        "scss"
      };
      server_opts.settings = {
        rootMarkers = { '.git', 'package.json' },
        languages = {
          scss = { stylelint }
        }
      }
    end

    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(server_opts)
end)
