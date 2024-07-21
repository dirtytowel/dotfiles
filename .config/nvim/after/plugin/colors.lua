function UpdateColors(color)
  require'colorizer'.setup()
	--color = color or "xresources"
	color = color or "base16-3024"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "Blue" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "Yellow" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "Gray20" })
end
UpdateColors()
