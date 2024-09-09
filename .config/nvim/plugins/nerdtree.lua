vim.g.NERDTreeGitStatusIndicatorMapCustom = {
    Modified  = 'M ',
    Staged    = 'A ',
    Untracked = '??',
    Renamed   = 'R ',
    Unmerged  = 'U ',
    Deleted   = 'D ',
    Dirty     = 'M ',
    Ignored   = '!!',
    Clean     = '  ',
    Unknown   = '  ',
}

vim.g.NERDTreeQuitOnOpen = "1"

vim.keymap.set("n", "<leader>pv", vim.cmd.NERDTreeToggle)
