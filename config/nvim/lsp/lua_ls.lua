vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = vim.fs.dirname(
        vim.fs.find({ "init.lua", ".git" }, { upward = true })[1]
    ),
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
    settings = {
        Lua = {
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.fn.stdpath("config"),
                    vim.fn.expand("$VIMRUNTIME/lua")
                }
            }
        }
    }
}
