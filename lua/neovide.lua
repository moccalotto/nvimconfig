if vim.g.neovide then
    -- print("neovide detected")
    -- vim.o.guifont = 'CaskaydiaCove Nerd Font'

    vim.g.neovide_refresh_rate_idle = 2
    vim.g.neovide_refresh_rate = 60

    -- vim.g.neovide_theme = 'auto' -- this seems to make neovide have a light theme instead of a dark one.

    vim.g.neovide_hide_mouse_when_typing = true
end
