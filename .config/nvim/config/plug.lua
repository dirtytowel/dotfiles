local vim = vim
local Plug = vim.fn['plug#']
local plugin_configs = {}

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- AUTOPAIRS --
-- https://github.com/windwp/nvim-autopairs
Plug('windwp/nvim-autopairs')
table.insert(plugin_configs, function() require('nvim-autopairs').setup {} end)

-- TELESCOPE --
-- https://github.com/nvim-telescope/telescope.nvim
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
table.insert(plugin_configs, function() require("plugins.telescope") end)

-- HARPOON --
-- https://github.com/ThePrimeagen/harpoon
Plug('ThePrimeagen/harpoon')
table.insert(plugin_configs, function() require("plugins.harpoon") end)

-- BASE16 --
-- https://github.com/chriskempson/base16-vim
Plug('chriskempson/base16-vim')
table.insert(plugin_configs, function() require("plugins.colors") end)

-- COLORIZER --
-- https://github.com/norcalli/nvim-colorizer.lua
Plug('norcalli/nvim-colorizer.lua')

-- TREESITTER --
-- https://github.com/nvim-treesitter/nvim-treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('nvim-treesitter/playground')
table.insert(plugin_configs, function() require("plugins.treesitter") end)

-- UNDOTREE --
-- https://github.com/mbbill/undotree
Plug('mbbill/undotree')
table.insert(plugin_configs, function() require("plugins.undotree") end)

-- LSP-ZERO --
-- https://github.com/VonHeikemen/lsp-zero.nvim
Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v4.x'})
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
table.insert(plugin_configs, function() require("plugins.lsp") end)

-- VIM-DEVICONS --
-- https://github.com/ryanoasis/vim-devicons
Plug('ryanoasis/vim-devicons')

-- VIM-VISUAL-MULTI --
-- https://github.com/mg979/vim-visual-multi
Plug('mg979/vim-visual-multi')
table.insert(plugin_configs, function() require("plugins.visual-multi") end)

-- kinda sucks should find another one
-- NERDTREE --
-- https://github.com/preservim/nerdtree
Plug('preservim/nerdtree')
Plug('Xuyuanp/nerdtree-git-plugin')
table.insert(plugin_configs, function() require("plugins.nerdtree") end)

-- LUALINE --
-- https://github.com/nvim-lualine/lualine.nvim
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
table.insert(plugin_configs, function() require("plugins.lualine") end)

-- GIT BLAME --
-- https://github.com/f-person/git-blame.nvim
--Plug('f-person/git-blame.nvim')

vim.call('plug#end')

-- Run the plugin-specific configurations
for _, config in ipairs(plugin_configs) do
  config()
end
