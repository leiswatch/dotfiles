local vim = vim
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','

-- ESC --
map('i', 'kj', "<ESC>", opts)
map('i', 'jj', "<ESC>", opts)
map('i', 'JJ', "<ESC>", opts)
map('i', 'KJ', "<ESC>", opts)

-- Split window --
map('n', 'ss', ':split<Return><C-w>w', opts)
map('n', 'sv', ':vsplit<Return><C-w>w', opts)

map('n', 'sh', '<C-w>h', opts)
map('n', 'sk', '<C-w>k', opts)
map('n', 'sj', '<C-w>j', opts)
map('n', 'sl', '<C-w>l', opts)

map('n', '<Tab>', ':tabnext<Return>', opts)
map('n', '<S-Tab>', ':tabprev<Return>', opts)

-- Telescope --
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files({layout_strategy='vertical', layout_config={width=0.8}, previewer=false})<cr>", opts)
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep({layout_strategy='vertical', layout_config={width=0.8}})<cr>", opts)
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags({layout_strategy='vertical', layout_config={width=0.8}})<cr>", opts)
map('n', '<leader>fb', ":lua require('telescope.builtin').buffers({layout_strategy='vertical', layout_config={width=0.8}})<cr>", opts)
-- Jester --
map('n', '<leader>jf', ":lua require('jester').run_file({ path_to_jest='./node_modules/.bin/jest' })<cr>", opts)
-- Tree --
map('n', '<C-n>', ":lua require'lir.float'.toggle()<cr>", opts)

-- BarBar --

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)
