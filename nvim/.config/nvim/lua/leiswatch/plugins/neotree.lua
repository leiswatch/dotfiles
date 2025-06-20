return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		event_handlers = {
			{
				event = "neo_tree_window_after_open",
				handler = function(args)
					if args.position == "left" or args.position == "right" then
						vim.cmd("wincmd =")
					end
				end,
			},
			{
				event = "neo_tree_window_after_close",
				handler = function(args)
					if args.position == "left" or args.position == "right" then
						vim.cmd("wincmd =")
					end
				end,
			},
		},
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = "single",
		enable_git_status = false,
		enable_diagnostics = false,
		window = {
			position = "left",
			width = "30%",
			auto_expand_width = false,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			-- mappings = {
			-- 	["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			-- },
		},
		filesystem = {
			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_hidden = false, -- only works on Windows for hidden files/directories
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					".git",
				},
			},
			hijack_netrw_behavior = "open_current",
			follow_current_file = {
				enabled = true,
			},
		},
		git_status = {
			window = {
				position = "float",
			},
		},
		default_component_configs = {
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
				-- then these will never be used.
				default = "*",
				highlight = "NeoTreeFileIcon",
			},
			git_status = {
				symbols = {
					-- Change type
					added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "✖", -- this can only be used in the git_status source
					renamed = "", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
			indent = {
				with_expanders = true,
				with_markers = true,
				-- indent_marker = "╎",
			},
			file_size = {
				enabled = false,
				-- required_width = 64, -- min width of window required to show this column
			},
			type = {
				enabled = false,
			},
			last_modified = {
				enabled = false,
			},
			created = {
				enabled = false,
			},
			symlink_target = {
				enabled = false,
			},
		},
	},
}
