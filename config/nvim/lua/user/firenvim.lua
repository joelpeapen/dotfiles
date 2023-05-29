vim.g.firenvim_config = {
    globalSettings = {
        alt = "all",
        cmdlineTimeout = 3000
    },
    localSettings = {
        [".*"] = {
            cmdline  = "neovim",
            content  = "text",
            priority = 0,
            selector = "textarea",
            takeover = "never"
        }
    }
}
