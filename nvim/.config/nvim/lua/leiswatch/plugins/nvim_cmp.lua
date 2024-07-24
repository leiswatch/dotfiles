return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		{
			"jdrupal-dev/css-vars.nvim",
			opts = {},
		},
		-- "FelipeLema/cmp-async-path",
	},
	event = { "InsertEnter", "CmdlineEnter" },

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			view = {
				entries = "custom",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
					side_padding = 1,
				},
				documentation = {
					border = "rounded",
					max_width = 120,
					max_height = 20,
					winhighlight = "FloatBorder:FloatBorder",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "supermaven" },
				{ name = "css_vars" },
				{ name = "nvim_lua" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
				-- { name = "async_path" },
				-- { name = "spell", keyword_length = 3, keyword_pattern = [[\w\+]] },
			}),
			enabled = function()
				-- disable completion in comments
				local context = require("cmp.config.context")
				local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
				local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })

				if buftype == "prompt" or filetype == "oil" then
					return false
				end

				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,
			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr" },
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					preset = "codicons",
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					-- symbol_map = cmp_kinds,
					symbol_map = {
                        Text = '  ',
						Method = "  ",
						Function = "  ",
						Constructor = "  ",
						Field = "  ",
						Variable = "  ",
						Class = "  ",
						Interface = "  ",
						Module = "  ",
						Property = "  ",
						Unit = "  ",
						Value = "  ",
						Enum = "  ",
						Keyword = "  ",
						Snippet = "  ",
						Color = "  ",
						File = "  ",
						Reference = "  ",
						Folder = "  ",
						EnumMember = "  ",
						Constant = "  ",
						Struct = "  ",
						Event = "  ",
						Operator = "  ",
						TypeParameter = "  ",
					},
				}),
			},
			-- sorting = {
				-- comparators = {
				-- 	cmp.config.compare.offset,
				-- 	cmp.config.compare.exact,
				-- 	cmp.config.compare.score,

				-- 	function(entry1, entry2)
				-- 		local _, entry1_under = entry1.completion_item.label:find("^_+")
				-- 		local _, entry2_under = entry2.completion_item.label:find("^_+")
				-- 		entry1_under = entry1_under or 0
				-- 		entry2_under = entry2_under or 0
				-- 		if entry1_under > entry2_under then
				-- 			return false
				-- 		elseif entry1_under < entry2_under then
				-- 			return true
				-- 		end
				-- 	end,

				-- 	cmp.config.compare.kind,
				-- 	cmp.config.compare.sort_text,
				-- 	cmp.config.compare.length,
				-- 	cmp.config.compare.order,
				-- },
			-- },
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
