vim.g.mapleader = ","
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope --
-- map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", opts)
map(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
	opts
)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- ESC --
map("i", "kj", "<ESC>", opts)
map("i", "jj", "<ESC>", opts)
map("i", "JJ", "<ESC>", opts)
map("i", "KJ", "<ESC>", opts)

-- Alternate buffer --
map("n", "<leader>vv", "<C-^>", opts)

-- Split window --
map("n", "ss", ":split<Return><C-w>w", opts)
map("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Move between windows --
map("n", "sh", "<C-w>h", opts)
map("n", "sk", "<C-w>k", opts)
map("n", "sj", "<C-w>j", opts)
map("n", "sl", "<C-w>l", opts)

-- NvimTree --
map("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

-- Lazygit --
map("n", "<leader>gg", ":LazyGit<cr>", opts)

-- Bufferline --
map("n", "L", ":BufferLineCycleNext<cr>", opts)
map("n", "H", ":BufferLineCyclePrev<cr>", opts)

-- Delete buffer --
map("n", "<leader>q", ":Bdelete<cr>", opts)
