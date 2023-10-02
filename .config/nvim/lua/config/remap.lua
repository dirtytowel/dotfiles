-- set leader key
vim.g.mapleader = " "
-- NERDTreeToggle
vim.keymap.set("n", "<leader>pv", vim.cmd.NERDTreeToggle)
-- SPLIT MANAGEMENT --
-- create splits
vim.keymap.set("n", "<leader>-", vim.cmd.split)
vim.keymap.set("n", "<leader>\\", vim.cmd.vsplit)
-- navigate splits
vim.keymap.set("n", "<C-k>", function() vim.cmd("wincmd k") end)
vim.keymap.set("n", "<C-j>", function() vim.cmd("wincmd j") end)
vim.keymap.set("n", "<C-h>", function() vim.cmd("wincmd h") end)
vim.keymap.set("n", "<C-l>", function() vim.cmd("wincmd l") end)

-- undotree
vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)
