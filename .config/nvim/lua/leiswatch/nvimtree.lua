require'nvim-tree'.setup{
  update_cwd = true,
  update_focused_file = {
    update_cwd = true,
    enable = true,
  },
  auto_close = true,
  hijack_netrw = false,
  hijack_cursor = true,
  view = {
    width = 50,
    number = true,
    relativenumber = false,
    auto_resize = true,
  },
  diagnostics = {
    enable = true,
  }
}
