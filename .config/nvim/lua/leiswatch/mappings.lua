vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope --
map("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
map("n", "<leader>fw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", opts)
--[[ map("n", "<leader>fm", "<cmd>Telescope harpoon marks<cr>", opts) ]]

-- Alternate buffer --
map("n", "<leader>vv", "<C-^>", opts)

-- Split window --
map("n", "ss", ":split<Return><C-w>w", opts)
map("n", "sv", ":vsplit<Return><C-w>w", opts)

-- NvimTree --
map("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

-- Lazygit --
map("n", "<leader>gg", ":LazyGit<cr>", opts)

-- Bufferline --
map("n", "L", ":BufferLineCycleNext<cr>", opts)
map("n", "H", ":BufferLineCyclePrev<cr>", opts)
map("n", "<leader>bn", ":BufferLineMoveNext<cr>", opts)
map("n", "<leader>bp", ":BufferLineMovePrev<cr>", opts)

-- Delete buffer --
map("n", "<leader>q", ":Bdelete<cr>", opts)

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- Harpoon
map("n", "<leader>m", ':lua require("harpoon.mark").add_file()<cr>', opts)
map("n", "<leader>fm", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
map("n", "<leader>h", ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
map("n", "<leader>j", ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
map("n", "<leader>k", ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
map("n", "<leader>l", ':lua require("harpoon.ui").nav_file(4)<cr>', opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

map("i", "<C-c>", "<Esc>", opts)

map("x", "<leader>p", '"_dP', opts)
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', { silent = true })

map("n", "<C-j>", "<cmd>lua vim.diagnostic.open_float({border='rounded'})<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<leader>eq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
