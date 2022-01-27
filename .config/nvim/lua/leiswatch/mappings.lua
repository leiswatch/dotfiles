local vim = vim
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','

-- ESC --
map('i', 'kj', "<ESC>", opts)
map('i', 'jk', "<ESC>", opts)
map('i', 'JK', "<ESC>", opts)
map('i', 'KJ', "<ESC>", opts)

-- Telescope --
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files({layout_strategy='vertical', layout_config={width=0.8}})<cr>", opts)
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep({layout_strategy='vertical', layout_config={width=0.8}})<cr>", opts)
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags({layout_strategy='vertical', layout_config={width=0.8}})<cr>", opts)
map('n', '<leader>fb', ":lua require('telescope.builtin').buffers({layout_strategy='vertical', layout_config={width=0.8}})<cr>", opts)
