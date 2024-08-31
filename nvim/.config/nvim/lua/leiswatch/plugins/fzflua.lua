return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
	config = function()
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			defaults = {
				file_icons = true,
				color_icons = true,
				git_icons = false,
			},
			files = {
				multiprocess = true,
				winopts = {
					width = 0.75,
					height = 0.5,
					preview = { hidden = "hidden" },
				},
				cwd_prompt = false,
				prompt = "  ",
			},
			grep = {
				multiprocess = true,
				file_ignore_patterns = {
					"%.git",
					"%.yarn",
					"%.cache",
					"%.DS_STORE",
					"%.next",
					"%.md",
					"%.nx",
					"%.keystone",
					"yarn%.lock",
					"package%-lock%.json",
					"node%_modules",
					"!.env",
				},
				winopts = {
					width = 0.95,
					height = 0.95,
					preview = {
						horizontal = "right:40%", -- right|left:size
					},
				},
				cwd_prompt = false,
				prompt = "  ",
				actions = {
					["ctrl-q"] = {
						fn = actions.file_edit_or_qf,
						prefix = "select-all+",
					},
				},
			},
		})
	end,
}
