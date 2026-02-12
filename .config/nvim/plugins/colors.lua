color = color or "dim"
vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermfg = "Blue" })
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = "Yellow" })
--vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "CursorLine", { reverse = true })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { ctermfg = "Magenta" })
vim.api.nvim_set_hl(0, "Pmenu", { ctermfg = "Magenta", ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true })
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = "Magenta" })

for _, group in ipairs({
  "Pmenu",
  "PmenuSel",
  "PmenuSbar",
  "PmenuThumb",
  "NormalFloat",
  "FloatBorder",
  "CmpPmenu",
  "CmpSel",
  "CmpDoc",
  "CmpDocBorder",
}) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end
