require("indent_blankline").setup{
  show_current_context = true,
  show_current_context_start = true,
  buftype_exclude = { "terminal", "prompt", "nofile", "help" },
  filetype_exclude = { "dashboard", "packer", "lspinfo" },
  use_treesitter = true,
}
