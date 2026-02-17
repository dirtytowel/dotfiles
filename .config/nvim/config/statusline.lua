local a = vim.api
local h = a.nvim_set_hl

local mode_name = {
  n = "NORMAL", no = "N-PENDING", v = "VISUAL", V = "V-LINE", ["\22"] = "V-BLOCK",
  s = "SELECT", S = "S-LINE", ["\19"] = "S-BLOCK", i = "INSERT", R = "REPLACE",
  c = "COMMAND", r = "PROMPT", ["!"] = "SHELL", t = "TERMINAL",
}

local mode_pat = {
  { "^i", 2 },
  { "^[vV\22sS\19]", 5 },
  { "^R", 1 },
  { "^[cgr!]", 4 },
  { "^t", 6 },
}

local function mode_color(m)
  for i = 1, #mode_pat do
    local p, c = mode_pat[i][1], mode_pat[i][2]
    if m:find(p) then
      return c
    end
  end
  return 3
end

local function paint_base()
  for _, x in ipairs({
    { "StatusLine", { ctermfg = 3, ctermbg = "NONE" } },
    { "StatusLineNC", { ctermfg = 3, ctermbg = "NONE" } },
    { "StlInfo", { ctermfg = 6, ctermbg = "NONE" } },
    { "StlPath", { ctermfg = 3, ctermbg = "NONE" } },
    { "StlPos", { ctermfg = 16, ctermbg = 6, bold = true } },
  }) do
    h(0, x[1], x[2])
  end
end

local function paint_mode()
  local c = mode_color(a.nvim_get_mode().mode)
  h(0, "StlMode", { ctermfg = 16, ctermbg = c, bold = true })
  h(0, "StlPath", { ctermfg = c, ctermbg = "NONE" })
  vim.cmd.redrawstatus()
end

function _G.statusline_mode() return mode_name[vim.fn.mode()] or "UNKNOWN" end

paint_base()
paint_mode()

local g = a.nvim_create_augroup("statusline_theme", { clear = true })
a.nvim_create_autocmd("ColorScheme", { group = g, callback = function() paint_base(); paint_mode() end })
a.nvim_create_autocmd({ "ModeChanged", "VimEnter" }, { group = g, callback = paint_mode })

vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.statusline = "%#StlMode# %{v:lua.statusline_mode()} %#StlPath# %<%f %m%r%= %#StlInfo# %y%#StatusLine# %#StlPos# %l:%c %p%% "
