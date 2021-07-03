let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'typescript': ['prettier', 'eslint'], 'javascriptreact': ['prettier', 'eslint'], 'typescriptreact': ['prettier', 'eslint'], 'python': ['yapf']}

let g:ale_fix_on_save = 0
let g:ale_completion_autoimport = 1

let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'], 'javascriptreact': ['eslint'], 'typescriptreact': ['eslint'], 'python': ['pylint'], 'css': ['stylelint'], 'scss': ['stylelint'], 'sass': ['stylelint']}

nnoremap <silent> <leader>kk <Cmd>ALEFix <CR>
