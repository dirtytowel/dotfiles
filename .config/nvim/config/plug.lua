local vim = vim
local Plug = vim.fn['plug#']
local plugin_configs = {}
local function build_plugin_configs(name)
    table.insert(plugin_configs, function() require("plugins." .. name) end)
end
local function setup_plugin(plugin_name)
    table.insert(
      plugin_configs, function() require(plugin_name).setup {} end)
end

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- AUTOPAIRS --
-- https://github.com/windwp/nvim-autopairs
Plug('windwp/nvim-autopairs')
setup_plugin("nvim-autopairs")

-- TELESCOPE --
-- https://github.com/nvim-telescope/telescope.nvim
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '*' })
build_plugin_configs("telescope")

-- HARPOON --
-- https://github.com/ThePrimeagen/harpoon
Plug('ThePrimeagen/harpoon')
build_plugin_configs("harpoon")

-- dim colorscheme --
Plug('jeffkreeftmeijer/vim-dim')
build_plugin_configs("colors")

-- TREESITTER --
-- https://github.com/nvim-treesitter/nvim-treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
--Plug('nvim-treesitter/playground')
build_plugin_configs("treesitter")

-- UNDOTREE --
-- https://github.com/mbbill/undotree
Plug('mbbill/undotree')
build_plugin_configs("undotree")

-- VIM-DEVICONS --
-- https://github.com/ryanoasis/vim-devicons
--Plug('ryanoasis/vim-devicons')

-- VIM-VISUAL-MULTI --
-- https://github.com/mg979/vim-visual-multi
Plug('mg979/vim-visual-multi')
build_plugin_configs("visual-multi")

-- kinda sucks should find another one
-- NERDTREE --
-- https://github.com/preservim/nerdtree
Plug('preservim/nerdtree')
Plug('Xuyuanp/nerdtree-git-plugin')
build_plugin_configs("nerdtree")

-- GIT BLAME --
-- https://github.com/f-person/git-blame.nvim
Plug('f-person/git-blame.nvim')

-- Commenting --
-- https://github.com/numToStr/Comment.nvim
Plug("numToStr/Comment.nvim")
setup_plugin("Comment")

-- 99 ai slop --
-- https://github.com/ThePrimeagen/99
Plug('ThePrimeagen/99')
build_plugin_configs("99")

vim.call('plug#end')

-- Run the plugin-specific configurations
for _, config in ipairs(plugin_configs) do
  config()
end
