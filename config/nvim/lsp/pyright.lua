vim.lsp.config.pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = vim.fs.dirname(
        vim.fs.find({ ".git", "setup.py", "manage.py" }, { upward = true })[1]
    ),
    single_file_support = true,
    handlers = {
        ["textDocument/publishDiagnostics"] = function() end
    },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly"
            }
        }
    }
}
