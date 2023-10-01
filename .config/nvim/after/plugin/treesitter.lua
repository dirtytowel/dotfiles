require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "yaml", "toml", "bash", "ssh_config", "c", "lua", "rust", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd[[ 
  highlight Comment guifg=Gray
  highlight! link TSComment Comment
]]
