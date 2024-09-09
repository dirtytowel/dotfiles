-- set leader key
vim.g.mapleader = " "

-- SPLIT MANAGEMENT --
-- create splits
vim.keymap.set("n", "<leader>-", vim.cmd.split)
vim.keymap.set("n", "<leader>\\", vim.cmd.vsplit)
-- navigate splits
vim.keymap.set("n", "<C-k>", function() vim.cmd("wincmd k") end)
vim.keymap.set("n", "<C-j>", function() vim.cmd("wincmd j") end)
vim.keymap.set("n", "<C-h>", function() vim.cmd("wincmd h") end)
vim.keymap.set("n", "<C-l>", function() vim.cmd("wincmd l") end)

-- VISUALIZE TABS AND EOL --
vim.opt.listchars = { tab = '▸\\ ', eol = '¬' }
vim.api.nvim_set_keymap('n', '<leader>l', ':set list!<CR>', { noremap = true, silent = true })
-- Set true to enable by default:
vim.opt.list = false

-- SWITCH BETWEEN TAB AND DOUBLE SPACE --
vim.api.nvim_set_keymap('n', '<leader>	', ':set expandtab!<CR>', { noremap = true, silent = false})
