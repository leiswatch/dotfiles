if !exists('g:loaded_nvim_treesitter')
  finish
endif

lua << EOF
  require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = false,
      extended_mode = false, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    }
  }
EOF
