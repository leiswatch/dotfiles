nnoremap <leader>xx <cmd>LspTroubleToggle<cr>

lua << EOF
  require("trouble").setup {}
EOF
