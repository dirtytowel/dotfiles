local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- AUTOPAIRS --
-- https://github.com/windwp/nvim-autopairs
Plug('windwp/nvim-autopairs')

-- TELESCOPE --
-- https://github.com/nvim-telescope/telescope.nvim
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })

-- HARPOON --
-- https://github.com/ThePrimeagen/harpoon
Plug('nvim-lua/plenary.nvim')
Plug('ThePrimeagen/harpoon')

-- BASE16 --
-- https://github.com/chriskempson/base16-vim
Plug('chriskempson/base16-vim')

-- COLORIZER --
-- https://github.com/norcalli/nvim-colorizer.lua
Plug('norcalli/nvim-colorizer.lua')

 -- TREESITTER --
 -- https://github.com/nvim-treesitter/nvim-treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('nvim-treesitter/playground')

-- UNDOTREE --
-- https://github.com/mbbill/undotree
Plug('mbbill/undotree')

-- LSP-ZERO --
-- https://github.com/VonHeikemen/lsp-zero.nvim
Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v4.x'})
--- Uncomment these if you want to manage LSP servers from neovim
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
-- LSP Support
Plug('neovim/nvim-lspconfig')
-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')

-- VIM-DEVICONS --
-- https://github.com/ryanoasis/vim-devicons
Plug('ryanoasis/vim-devicons')

-- VIM-VISUAL-MULTI --
-- https://github.com/mg979/vim-visual-multi
Plug('mg979/vim-visual-multi')

-- kinda sucks should find another one
-- NERDTREE --
-- https://github.com/preservim/nerdtree
Plug('preservim/nerdtree')
Plug('Xuyuanp/nerdtree-git-plugin')

-- LUALINE --
-- https://github.com/nvim-lualine/lualine.nvim
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')

-- GIT BLAME --
-- https://github.com/f-person/git-blame.nvim
Plug('f-person/git-blame.nvim')

vim.call('plug#end')

require('nvim-autopairs').setup {}

require("plugins.colors")
require("plugins.harpoon")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.nerdtree")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.visual-multi")
