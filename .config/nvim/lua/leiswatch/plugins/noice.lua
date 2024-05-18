return {
	"folke/noice.nvim",
    enabled = true,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		lsp = {
			progress = {
				enabled = false,
			},
			hover = {
				enabled = true,
				silent = false, -- set to true to not show a message if hover is not available
				view = "hover", -- when nil, use defaults from documentation
				---@type NoiceViewOptions
				opts = { border = "single" }, -- merged with defaults from documentation
			},
			signature = {
				enabled = true,
			-- 	-- auto_open = {
			-- 	-- 	enabled = true,
			-- 	-- 	trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
			-- 	-- 	luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
			-- 	-- 	throttle = 50, -- Debounce lsp signature help request by 50ms
			-- 	-- },
			-- 	view = "hover", -- when nil, use defaults from documentation
			-- 	---@type NoiceViewOptions
				opts = { border = "single" }, -- merged with defaults from documentation
			},
			message = {
				-- Messages shown by lsp servers
				enabled = false,
				view = "notify",
				opts = {},
			},
			-- defaults for hover and signature help
			-- documentation = {
			-- 	view = "hover",
			-- 	---@type NoiceViewOptions
			-- 	opts = {
			-- 		border = "single",
			-- 		-- lang = "markdown",
			-- 		-- replace = true,
			-- 		-- render = "plain",
			-- 		-- format = { "{message}" },
			-- 		-- win_options = { concealcursor = "n", conceallevel = 3 },
			-- 	},
			-- },
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		cmdline = {
			enabled = false, -- enables the Noice cmdline UI
		},
		messages = {
			enabled = false, -- enables the Noice messages UI
		},

		popupmenu = {
			enabled = true, -- enables the Noice popupmenu UI
			---@type 'nui'|'cmp'
			backend = "cmp", -- backend to use to show regular cmdline completions
			---@type NoicePopupmenuItemKind|false
			-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
			kind_icons = {}, -- set to `false` to disable icons
		},
		notify = {
			enabled = false,
		},
		presets = {
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
}
