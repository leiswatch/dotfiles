local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>m", ':lua require("harpoon.mark").add_file()<cr>', opts)
vim.keymap.set("n", "<leader>fm", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
vim.keymap.set("n", "<leader>h", ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
vim.keymap.set("n", "<leader>j", ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
vim.keymap.set("n", "<leader>k", ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
vim.keymap.set("n", "<leader>l", ':lua require("harpoon.ui").nav_file(4)<cr>', opts)
