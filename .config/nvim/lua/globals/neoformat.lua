vim.cmd([[
  let g:neoformat_try_node_exe = 1
  let g:neoformat_run_all_formatters = 1

  let g:neoformat_basic_format_align = 1
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1

  let g:neoformat_enabled_python = ['yapf']
  let g:neoformat_enabled_lua = ['stylua']
  let g:neoformat_enabled_astro = ['prettier']
  let g:neoformat_enabled_css = ['stylelint']
  let g:neoformat_enabled_go = ['gofumpt', 'goimports']
  let g:neoformat_enabled_graphql = ['prettier']
  let g:neoformat_enabled_html = ['prettier']
  let g:neoformat_enabled_javascript = ['prettier']
  let g:neoformat_enabled_javascriptreact = ['prettier']
  let g:neoformat_enabled_typescript = ['prettier']
  let g:neoformat_enabled_typescriptreact = ['prettier']
  let g:neoformat_enabled_json = ['prettier']
  let g:neoformat_enabled_jsonc = ['prettier']
  let g:neoformat_enabled_less = ['stylelint']
  let g:neoformat_enabled_prisma = ['prettier']
  let g:neoformat_enabled_rust = ['rustfmt']
  let g:neoformat_enabled_sass = ['stylelint']
  let g:neoformat_enabled_scss = ['stylelint']
  let g:neoformat_enabled_yaml = ['prettier']
  ]])
