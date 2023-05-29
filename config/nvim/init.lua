if vim.g.started_by_firenvim == true then
    require("user.mappings")
    require("user.settings")
    require("user.colors")
    require("user.firenvim")
    vim.cmd('lua WriterMode()')
    vim.cmd([[colorscheme gruvbox-material
    set background=light]])
    print('hello from init')
else
    require("user")
end

-- GhostText
-- vim.g.nvim_ghost_autostart = 0
