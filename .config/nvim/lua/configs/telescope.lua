local telescope = require("telescope")
local actions = require("telescope.actions")
-- local lga_actions = require("telescope-live-grep-args.actions")

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
		},
		prompt_prefix = "  ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				width = 0.9,
				height = 0.9,
				preview_width = 0.45,
				prompt_position = "top",
			},
		},
		file_ignore_patterns = {
			"node_modules",
			"package-lock.json",
			"yarn.lock",
			"^.git/",
			".next/",
			".DS_STORE/",
			".yarn/",
			".cache",
			"CHANGELOG.md",
		},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = true,
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		color_devicons = true,
		previewer = true,
		prompt_title = false,
		use_less = true,
		path_display = { "truncate" },
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		-- file_previewer = require("telescope.previewers").cat.new,
		-- grep_previewer = require("telescope.previewers").vimgrep.new,
		-- qflist_previewer = require("telescope.previewers").qflist.new,
	},
	pickers = {
		find_files = {
			find_command = { "fd", "-t", "f", "-i", "-H", "--strip-cwd-prefix" },
			previewer = false,
			prompt_title = false,
			layout_config = {
				horizontal = {
					width = 0.75,
					height = 0.75,
					prompt_position = "top",
					-- preview_cutoff = 120,
					-- anchor = "N",
				},
			},
		},
		live_grep = {
			prompt_title = false,
			layout_config = {
				horizontal = {
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
