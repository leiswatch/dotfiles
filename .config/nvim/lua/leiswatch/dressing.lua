require("dressing").setup({
	input = {
		winblend = 0,
		border = "rounded",
		get_config = function()
      if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
        return { enabled = false }
      end
    end,
	},
	builtin = {
		winblend = 0,
		border = "rounded",
	},
})
