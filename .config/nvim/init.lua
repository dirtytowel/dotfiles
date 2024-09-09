-- Set the Lua package path to include the Neovim configuration directory
local config_path = vim.fn.stdpath('config') .. '/?.lua'
package.path = package.path .. ';' .. config_path

-- basic configs
require("config.remap")
require("config.set")

-- vim plug
require("config.plug")
