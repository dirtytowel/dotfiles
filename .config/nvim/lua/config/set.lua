-- fat cursor
vim.opt.guicursor = ""
-- shared system clipboard
vim.opt.clipboard = "unnamedplus"
-- relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "no"

-- 2 space tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- long running undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.wrap = true

vim.opt.updatetime = 50

-- 
vim.opt.colorcolumn = "80"

vim.opt.title = true


