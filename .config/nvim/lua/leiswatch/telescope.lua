local telescope = require("telescope")

telescope.setup({
	defaults = {
		-- mappings = {
		-- 	i = {
		-- 		["<C-u>"] = true,
		-- 	},
		-- },
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
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				width = 0.95,
				height = 0.95,
				preview_width = 0.45,
				prompt_position = "bottom",
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {
			"node_modules",
			"package-lock.json",
			"yarn.lock",
			"^.git/",
			".next/",
			".DS_STORE/",
			".yarn/",
			".cache",
		},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		previewer = true,
		prompt_title = false,
		use_less = true,
		path_display = { "truncate" },
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {
		find_files = {
			--[[ previewer = true, ]]
			find_command = { "fdfind", "--type", "f", "--strip-cwd-prefix", "--hidden", "--ignore-case" },
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

-- require("telescope").load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("git_worktree")
telescope.load_extension("harpoon")
telescope.load_extension("live_grep_args")
