return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	enabled = true,
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--ignore-case",
					"--hidden",
					"--trim",
					"--fixed-strings",
					"--sort=path",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "   ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						width = 0.9,
						height = 0.9,
						preview_width = 0.5,
						prompt_position = "top",
					},
				},
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
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				winblend = 0,
				border = true,
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				color_devicons = true,
				previewer = true,
				prompt_title = false,
				use_less = true,
				-- path_display = {
				-- 	filename_first = {
				-- 		reverse_directories = false,
				-- 	},
				-- 	"truncate",
				-- },
				-- path_display = function(opts, path)
				-- 	local tail = require("telescope.utils").path_tail(path)
				-- 	return string.format("%s (%s)", tail, path)
				-- end,
				-- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			},
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type",
						"f",
						"--ignore-case",
						"--hidden",
						"--strip-cwd-prefix=always",
						"--color=never",
					},
					previewer = false,
					prompt_title = false,
					results_title = false,
					layout_config = {
						horizontal = {
							width = 0.6,
							height = 0.6,
							prompt_position = "top",
						},
					},
				},
				live_grep = {
					prompt_title = false,
					results_title = false,
					layout_config = {
						horizontal = {
							width = 0.95,
							height = 0.95,
							prompt_position = "top",
						},
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "ignore_case", -- or "ignore_case" or "respect_case" or "smart_case"
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
