local catppuccin = require("catppuccin")

catppuccin.setup({
    transparent_background = true,
    term_colors = true,
    styles = {
      comments = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
    },
    integrations = {
      barbar = true,
      ts_rainbow = true,
      lsp_saga = true,
      nvimtree = {
        enabled = false,
        show_root = true,
        transparent_panel = true,
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
    }
})
