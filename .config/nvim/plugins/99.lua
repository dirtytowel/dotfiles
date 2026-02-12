
local utils = require("99.utils")

utils.random_file = function()
  local dir = "/tmp/99"
  if not vim.uv.fs_stat(dir) then
    pcall(vim.uv.fs_mkdir, dir, 493)
  end
  return string.format("%s/99-%d", dir, math.floor(math.random() * 10000))
end

local _99 = require("99")

_99.setup({
  model = "openai/gpt-5.3-codex",
})

vim.keymap.set("v", "<leader>9v", function()
  _99.visual()
end)

vim.keymap.set("v", "<leader>9s", function()
  _99.stop_all_requests()
end)
