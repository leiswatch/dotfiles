if !exists('g:lspconfig')
  finish
endif

let g:completion_enable_snippet = 'vim-vsnip'

lua << EOF
  require'snippets'.use_suggested_mappings()

  local nvim_lsp = require('lspconfig')
  local protocol = require('vim.lsp.protocol')

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true;

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- Mappings
    local opts = { noremap = true, silent = true }

    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    protocol.CompletionItemKind = {
      '', -- Text
      '', -- Method
      '', -- Function
      '', -- Constructor
      '', -- Field
      '', -- Variable
      '', -- Class
      'ﰮ', -- Interface
      '', -- Module
      '', -- Property
      '', -- Unit
      '', -- Value
      '', -- Enum
      '', -- Keyword
      '﬌', -- Snippet
      '', -- Color
      '', -- File
      '', -- Reference
      '', -- Folder
      '', -- EnumMember
      '', -- Constant
      '', -- Struct
      '', -- Event
      'ﬦ', -- Operator
      '', -- TypeParameter
    }

    require 'completion'.on_attach(client, bufnr)
  end

  nvim_lsp.tsserver.setup {
    capabilities = capabilities;
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
  }

  nvim_lsp.pyright.setup {
    capabilities = capabilities;
    on_attach = on_attach,
  }

  nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities;
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
  }

  nvim_lsp.cssls.setup {
    capabilities = capabilities;
    on_attach=on_attach,
  }
EOF
