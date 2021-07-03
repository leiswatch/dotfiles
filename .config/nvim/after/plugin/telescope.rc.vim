nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
  local actions = require('telescope.actions')

  require('telescope').setup{
    defaults = {
      mappings = {
        n = {
          ["q"] = actions.close
        },
      },
      file_ignore_patterns = {"node_modules/", "package-lock.json", "yarn.lock", ".git/", ".next/", ".DS_STORE/"},
      vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--hidden',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
      },
      color_devicons = true,
    }
  }
EOF
