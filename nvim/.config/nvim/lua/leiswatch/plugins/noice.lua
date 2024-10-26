return {
	"folke/noice.nvim",
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			progress = {
				enabled = false,
			},
			hover = {
				enabled = true,
				silent = true, -- set to true to not show a message if hover is not available
				view = nil, -- when nil, use defaults from documentation
				opts = {
					border = "rounded",
					size = {
						max_height = 20,
						max_width = 120,
					},
				}, -- merged with defaults from documentation
			},
			signature = {
				enabled = true,
				opts = {
					border = "rounded",
					size = {
						max_height = 20,
						max_width = 120,
					},
				}, -- merged with defaults from documentation
			},
			message = {
				-- Messages shown by lsp servers
				enabled = false,
				view = "notify",
				opts = {},
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
			kind_icons = {}, -- set to `false` to disable icons
		},
		notify = {
			enabled = false,
		},
		presets = {
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		health = {
			checker = false, -- Disable if you don't want health checks to run
		},
	},
}
