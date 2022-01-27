local vim = vim

-- Eslint
vim.cmd [[
  augroup Eslint
    autocmd BufWritePre *.ts EslintFixAll
    autocmd BufWritePre *.tsx EslintFixAll
    autocmd BufWritePre *.js EslintFixAll
    autocmd BufWritePre *.jsx EslintFixAll
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
