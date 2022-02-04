local vim = vim

-- ESlint --
vim.cmd [[
  augroup ESlint
    autocmd BufWritePre *.ts EslintFixAll
    autocmd BufWritePre *.tsx EslintFixAll
    autocmd BufWritePre *.js EslintFixAll
    autocmd BufWritePre *.jsx EslintFixAll
  augroup END
]]

-- Stylelint --
vim.cmd [[
  augroup Stylelint
    autocmd BufWritePre *.scss :lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePre *.css :lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePre *.postcss :lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePre *.sass :lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePre *.less :lua vim.lsp.buf.formatting_sync()
  augroup END
]]

vim.cmd[[let g:dashboard_default_executive ='telescope.nvim']]

vim.cmd[[
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'LEADER s l',
\ 'find_history'       : 'LEADER f h',
\ 'find_file'          : 'LEADER f f',
\ 'new_file'           : 'LEADER c n',
\ 'change_colorscheme' : 'LEADER t c',
\ 'find_word'          : 'LEADER f a',
\ 'book_marks'         : 'LEADER f b',
\ }
]]
