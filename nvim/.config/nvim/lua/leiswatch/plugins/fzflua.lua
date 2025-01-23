return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
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
				-- formatter = "path.filename_first",
				winopts = {
					width = 0.9,
					height = 0.6,
					preview = { hidden = "hidden" },
					border = "single",
					col = 0.5,
					row = 0.1,
					title = "Files",
					title_flags = false,
					title_pos = "center",
				},
				cwd_prompt = false,
				prompt = "  ",
			},
			grep = {
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --trim --max-columns=4096 -e",
				multiprocess = true,
				ignore_patterns = {
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
					border = "single",
					width = 0.95,
					height = 0.95,
					title = "Search",
					title_pos = "center",
					preview = {
						horizontal = "right:50%", -- right|left:size
						border = "single",
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
			keymap = {
				true,
				-- Below are the default binds, setting any value in these tables will override
				-- the defaults, to inherit from the defaults change [1] from `false` to `true`
				builtin = {
					true,
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
				},

				fzf = {
					true, -- do not inherit from defaults
					["ctrl-z"] = "abort",
					["ctrl-u"] = "unix-line-discard",
					["ctrl-f"] = "half-page-down",
					["ctrl-b"] = "half-page-up",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["alt-a"] = "toggle-all",
					["alt-g"] = "first",
					["alt-G"] = "last",
					-- Only valid with fzf previewers (bat/cat/git/etc)
					["f3"] = "toggle-preview-wrap",
					["f4"] = "toggle-preview",
					["shift-down"] = "preview-page-down",
					["shift-up"] = "preview-page-up",
				},
			},

			previewers = {
				bat = {
					cmd = "bat",
					args = "--color=always --style=numbers,changes",
					theme = "tokyonight-night",
				},
				builtin = {
					syntax = true,
					border = "single",
					treesitter = {
						enabled = true,
						disabled = {},
						-- nvim-treesitter-context config options
						context = { max_lines = 3, trim_scope = "inner" },
					},
				},
			},
		})
	end,
}
