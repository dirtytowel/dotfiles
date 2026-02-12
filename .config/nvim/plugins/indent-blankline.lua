local has_ibl, ibl = pcall(require, "ibl")

if has_ibl then
  ibl.setup({
    enabled = false,
    scope = {
      enabled = false,
    },
  })
else
  local has_indent_blankline, indent_blankline = pcall(require, "indent_blankline")
  if has_indent_blankline then
    indent_blankline.setup({
      show_current_context = false,
      show_current_context_start = false,
    })

    if vim.fn.exists(":IndentBlanklineDisable") == 2 then
      vim.cmd("IndentBlanklineDisable")
    elseif vim.fn.exists(":IndentBlanklineToggle") == 2 then
      vim.cmd("IndentBlanklineToggle")
    end
  end
end

vim.keymap.set("n", "<leader>i", function()
  if vim.fn.exists(":IBLToggle") == 2 then
    vim.cmd("IBLToggle")
  elseif vim.fn.exists(":IndentBlanklineToggle") == 2 then
    vim.cmd("IndentBlanklineToggle")
  end
end, { desc = "Toggle indent guides" })

vim.opt.listchars = {
  tab = "▸ ",
  space = "·",
  eol = "¬",
}

vim.keymap.set("n", "<leader>l", function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle whitespace chars" })

vim.opt.list = false
