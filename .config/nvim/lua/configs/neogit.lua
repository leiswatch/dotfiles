local neogit = require("neogit")

neogit.setup({
  integrations = {
    diffview = true,
  },
  kind = "vsplit",
})
