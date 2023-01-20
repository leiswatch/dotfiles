local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- local has_words_before = function()
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- Catppuccin Mocha
vim.api.nvim_set_hl(0, "CatppuccinBorder", { bg = "NONE", fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "CatppuccinNormal", { bg = "NONE", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "CatppucinCursorLine", { bg = "#313244" })

-- Rose Pine
-- vim.api.nvim_set_hl(0, "RosePineBorder", { bg = "NONE", fg = "#403d52" })
-- vim.api.nvim_set_hl(0, "RosePineNormal", { bg = "NONE", fg = "#e0def4" })
-- vim.api.nvim_set_hl(0, "RosePineCursorLine", { bg = "#524f67" })

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:CatppuccinNormal,FloatBorder:CatppuccinBorder,CursorLine:CatppucinCursorLine",
			-- winhighlight = "Normal:RosePineNormal,FloatBorder:RosePineBorder,CursorLine:RosePineCursorLine",
			-- col_offset = -3,
			-- side_padding = 0,
		}),
		documentation = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:CatppuccinNormal,FloatBorder:CatppuccinBorder,CursorLine:CatppucinCursorLine",
			-- winhighlight = "Normal:RosePineNormal,FloatBorder:RosePineBorder,CursorLine:RosePineCursorLine",
			-- side_padding = 0,
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- 	["<Tab>"] = cmp.mapping(function(fallback)
		-- 		if cmp.visible() then
		-- 			cmp.select_next_item()
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 			luasnip.expand_or_jump()
		-- 		elseif has_words_before() then
		-- 			cmp.complete()
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end, { "i", "s" }),
		-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 		if cmp.visible() then
		-- 			cmp.select_prev_item()
		-- 		elseif luasnip.jumpable(-1) then
		-- 			luasnip.jump(-1)
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
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
	-- formatting = {
	-- 	fields = { "kind", "abbr", "menu" },
	-- 	format = function(entry, vim_item)
	-- 		local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
	-- 		local strings = vim.split(kind.kind, "%s", { trimempty = true })
	-- 		kind.kind = " " .. strings[1] .. " "
	-- 		kind.menu = "    (" .. strings[2] .. ")"

	-- 		return kind
	-- 	end,
	-- },
	formatting = {
		format = lspkind.cmp_format(),
	},
	sorting = {
		comparators = {
			cmp.config.compare.locality,
			cmp.config.compare.recently_used,
			cmp.config.compare.score,
			cmp.config.compare.offset,
			cmp.config.compare.order,
			-- cmp.config.compare.exact,
			-- cmp.config.compare.kind,
			-- cmp.config.compare.sort_text,
			-- cmp.config.compare.length,
		},
	},
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
