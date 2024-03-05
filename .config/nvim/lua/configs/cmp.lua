local colors = require("catppuccin.palettes").get_palette("mocha")

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Catppuccin Mocha
vim.api.nvim_set_hl(0, "CatppuccinBorder", { bg = "NONE", fg = colors.surface1 })
vim.api.nvim_set_hl(0, "CatppuccinNormal", { bg = "NONE", fg = colors.text })
vim.api.nvim_set_hl(0, "CatppucinCursorLine", { bg = colors.surface1 })

vim.g.sass_variables_file = "_variables.scss"

cmp.setup({
	view = {
		entries = "custom",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	completion = {
		completeopt = "menuone,noinsert,noselect",
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "single",
			winhighlight = "Normal:CatppuccinNormal,FloatBorder:CatppuccinBorder,CursorLine:CatppucinCursorLine",
		}),
		documentation = cmp.config.window.bordered({
			border = "single",
			winhighlight = "Normal:CatppuccinNormal,FloatBorder:CatppuccinBorder,CursorLine:CatppucinCursorLine",
		}),
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
		{ name = "sass-variables" },
		{ name = "codeium" },
		{ name = "nvim_lua" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
		-- { name = "spell", keyword_length = 3, keyword_pattern = [[\w\+]] },
	}),
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "prompt" then
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
		-- format = lspkind.cmp_format(),
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50, symbol_map = { Codeium = "" } })(
				entry,
				vim_item
			)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = " (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},
	-- matching = {
	-- 	disallow_fuzzy_matching = true,
	-- 	disallow_fullfuzzy_matching = true,
	-- 	disallow_partial_fuzzy_matching = true,
	-- 	disallow_partial_matching = true,
	-- 	disallow_prefix_unmatching = false,
	-- },
	-- sorting = {
	-- 	comparators = {
	-- 		cmp.config.compare.offset,
	-- 		cmp.config.compare.exact,
	-- 		cmp.config.compare.score,
	-- 		cmp.config.recently_used,

	-- 		function(entry1, entry2)
	-- 			local _, entry1_under = entry1.completion_item.label:find("^_+")
	-- 			local _, entry2_under = entry2.completion_item.label:find("^_+")
	-- 			entry1_under = entry1_under or 0
	-- 			entry2_under = entry2_under or 0
	-- 			if entry1_under > entry2_under then
	-- 				return false
	-- 			elseif entry1_under < entry2_under then
	-- 				return true
	-- 			end
	-- 		end,

	-- 		cmp.config.compare.kind,
	-- 		cmp.config.compare.sort_text,
	-- 		cmp.config.compare.length,
	-- 		cmp.config.compare.order,
	-- 	},
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
