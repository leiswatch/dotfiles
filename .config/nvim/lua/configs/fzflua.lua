local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
	winopts = {
		border = "single",
		height = 0.9, -- window height
		width = 0.95, -- window width
		preview = {
			-- default = "bat", -- override the default previewer?
			-- default uses the 'builtin' previewer
			border = "border", -- border|noborder, applies only to
			-- native fzf previewers (bat/cat/git/etc)
			wrap = "nowrap", -- wrap|nowrap
			hidden = "nohidden", -- hidden|nohidden
			vertical = "down:45%", -- up|down:size
			horizontal = "right:45%", -- right|left:size
			layout = "flex", -- horizontal|vertical|flex
			flip_columns = 120, -- #cols to switch to horizontal on flex
			-- Only used with the builtin previewer:
			title = true, -- preview border title (file/buf)?
			title_pos = "center", -- left|center|right, title alignment
			scrollbar = "float", -- `false` or string:'float|border'
			-- float:  in-window floating border
			-- border: in-border chars (see below)
			scrolloff = "-2", -- float scrollbar offset from right
			-- applies only when scrollbar = 'float'
			scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
			-- applies only when scrollbar = 'border'
			delay = 200, -- delay(ms) displaying the preview
			-- prevents lag on fast scrolling
			winopts = { -- builtin previewer window options
				number = true,
				relativenumber = false,
				cursorline = true,
				cursorlineopt = "both",
				cursorcolumn = false,
				signcolumn = "no",
				list = false,
				foldenable = false,
				foldmethod = "manual",
			},
		},
	},
	files = {
		-- default = "bat",
		previewer = false, -- uncomment to override previewer
		-- (name from 'previewers' table)
		-- set to 'false' to disable
		prompt = "  ",
		multiprocess = true, -- run command in a separate process
		git_icons = true, -- show git icons?
		file_icons = true, -- show file icons?
		color_icons = true, -- colorize file|git icons
		-- path_shorten   = 1,              -- 'true' or number, shorten path?
		-- executed command priority is 'cmd' (if exists)
		-- otherwise auto-detect prioritizes `fd`:`rg`:`find`
		-- default options are controlled by 'fd|rg|find|_opts'
		-- NOTE: 'find -printf' requires GNU find
		-- cmd            = "find . -type f -printf '%P\n'",
		find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
		rg_opts = [[--color=never --files --hidden --follow -g "!.git"]],
		fd_opts = [[--color=never --type f --hidden -i --follow --exclude .git]],
		-- by default, cwd appears in the header only if {opts} contain a cwd
		-- parameter to a different folder than the current working directory
		-- uncomment if you wish to force display of the cwd as part of the
		-- query prompt string (fzf.vim style), header line or both
		cwd_header = false,
		cwd_prompt = false,
		cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
		cwd_prompt_shorten_val = 1, -- shortened path parts length
		toggle_ignore_flag = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
		actions = {
			["ctrl-g"] = { actions.toggle_ignore },
		},
		winopts = {
			height = 0.5,
			width = 0.75,
			row = 0.5,
		},
	},
	grep = {
		prompt = "  ",
		input_prompt = "Grep For❯ ",
		multiprocess = true, -- run command in a separate process
		git_icons = true, -- show git icons?
		file_icons = true, -- show file icons?
		color_icons = true, -- colorize file|git icons
		-- executed command priority is 'cmd' (if exists)
		-- otherwise auto-detect prioritizes `rg` over `grep`
		-- default options are controlled by 'rg|grep_opts'
		-- cmd            = "rg --vimgrep",
		grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
		-- set to 'true' to always parse globs in both 'grep' and 'live_grep'
		-- search strings will be split using the 'glob_separator' and translated
		-- to '--iglob=' arguments, requires 'rg'
		-- can still be used when 'false' by calling 'live_grep_glob' directly
		rg_glob = false, -- default to glob parsing?
		glob_flag = "--iglob", -- for case sensitive globs use '--glob'
		glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
		-- advanced usage: for custom argument parsing define
		-- 'rg_glob_fn' to return a pair:
		--   first returned argument is the new search query
		--   second returned argument are additional rg flags
		-- rg_glob_fn = function(query, opts)
		--   ...
		--   return new_query, flags
		-- end,
		actions = {
			-- actions inherit from 'actions.files' and merge
			-- this action toggles between 'grep' and 'live_grep'
			["ctrl-g"] = { actions.grep_lgrep },
			-- uncomment to enable '.gitignore' toggle for grep
			["ctrl-r"] = { actions.toggle_ignore },
		},
		no_header = false, -- hide grep|cwd header?
		no_header_i = false, -- hide interactive header?
	},

	keymap = {
		-- These override the default tables completely
		-- no need to set to `false` to disable a bind
		-- delete or modify is sufficient
		builtin = {
			["<C-d>"] = "preview-page-down",
			["<C-u>"] = "preview-page-up",
			["<C-l>"] = "preview-page-reset",
			["<a-y>"] = "select-all+accept",
		},
	},
})
