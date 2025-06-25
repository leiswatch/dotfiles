return {
	"saghen/blink.cmp",
	enabled = true,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			dependencies = { "Bilal2453/luvit-meta" },
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{
			"saghen/blink.compat",
			-- use v2.* for blink.cmp v1.*
			version = "2.*",
			-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
			lazy = true,
			-- make sure to set opts so that lazy.nvim calls blink.compat's setup
			opts = {},
		},
		{ "philosofonusus/ecolog.nvim", opts = { integrations = { blink_cmp = true } } },
	},

	event = { "InsertEnter", "CmdlineEnter" },

	-- use a release tag to download pre-built binaries
	version = "1.*",

	opts = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		return {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = { preset = "default" },
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					"exact",
					"score",
					"sort_text",
					"label",
					"kind",
				},
			},

			snippets = { preset = "luasnip" },
			completion = {
				keyword = { range = "prefix" },
				ghost_text = { enabled = false },
				accept = {
					resolve_timeout_ms = 500,
					auto_brackets = {
						enabled = false,
					},
				},
				menu = {
					auto_show = true,
					border = "single",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
					draw = {
						-- treesitter = { "lsp" },
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
						-- components = {
						-- kind_icon = {
						-- 	text = function(ctx)
						-- 		local icon = require("lspkind").symbolic(ctx.kind, {
						-- 			mode = "symbol",
						-- 			preset = "codicons",
						-- 		})

						-- 		return icon .. ctx.icon_gap
						-- 	end,
						-- },
						-- },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					window = {
						border = "single",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
			},
			signature = {
				window = {
					border = "single",
				},
			},

			cmdline = {
				keymap = { preset = "inherit" },
				completion = {
					menu = { auto_show = true },
					ghost_text = { enabled = true },
				},
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
				kind_icons = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = "",
					Field = "",
					Variable = "",
					Class = "",
					Interface = "",
					Module = "",
					Property = "",
					Unit = "",
					Value = "",
					Enum = "",
					Keyword = "",
					Snippet = "",
					Color = "",
					File = "",
					Reference = "",
					Folder = "",
					EnumMember = "",
					Constant = "",
					Struct = "",
					Event = "",
					Operator = "",
					TypeParameter = "",
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "cmdline", "lazydev", "ecolog" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					ecolog = { name = "ecolog", module = "ecolog.integrations.cmp.blink_cmp" },
				},
			},
		}
	end,
	opts_extend = { "sources.default" },
}
