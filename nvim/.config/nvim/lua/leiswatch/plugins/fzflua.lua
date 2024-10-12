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
					height = 0.75,
					preview = { hidden = "hidden" },
					border = 'single',
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
					border = 'single',
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

			keymap = {
				false,
				-- Below are the default binds, setting any value in these tables will override
				-- the defaults, to inherit from the defaults change [1] from `false` to `true`
				builtin = {
					-- neovim `:tmap` mappings for the fzf win
					["<M-Esc>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
					["<F1>"] = "toggle-help",
					["<F2>"] = "toggle-fullscreen",
					-- Only valid with the 'builtin' previewer
					["<F3>"] = "toggle-preview-wrap",
					["<F4>"] = "toggle-preview",
					-- Rotate preview clockwise/counter-clockwise
					["<F5>"] = "toggle-preview-ccw",
					["<F6>"] = "toggle-preview-cw",
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
					["<M-S-down>"] = "preview-down",
					["<M-S-up>"] = "preview-up",
				},
			},
		})
	end,
}
