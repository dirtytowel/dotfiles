-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Define the post-installation function
local post_installation = function()
    -- Call the specific UpdateColors() function from `colors.lua`.
    require("after.plugin.colors").UpdateColors()
end

return require('packer').startup(function(use)

	-- PACKER --
  -- https://github.com/wbthomason/packer.nvim
	use 'wbthomason/packer.nvim'

  -- TELESCOPE --
  -- https://github.com/nvim-telescope/telescope.nvim
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  -- HARPOON --
  -- https://github.com/ThePrimeagen/harpoon
  use {
    'ThePrimeagen/harpoon', 
		requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- BASE16 --
  -- https://github.com/chriskempson/base16-vim
  use ('chriskempson/base16-vim')

--  -- TREESITTER --
--  -- https://github.com/nvim-treesitter/nvim-treesitter
--	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
--	use('nvim-treesitter/playground')

  -- UNDOTREE --
  -- https://github.com/mbbill/undotree
	use('mbbill/undotree')


  -- LSP-ZERO --
  -- https://github.com/VonHeikemen/lsp-zero.nvim
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

  -- VIM-DEVICONS --
  -- https://github.com/ryanoasis/vim-devicons
  use('ryanoasis/vim-devicons')

  -- VIM-VISUAL-MULTI --
  -- https://github.com/mg979/vim-visual-multi
  use('mg979/vim-visual-multi')

  -- kinda sucks should find another one
  -- NERDTREE --
  -- https://github.com/preservim/nerdtree
  use('preservim/nerdtree')
  use('Xuyuanp/nerdtree-git-plugin')

  -- LUALINE --
  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

end)
