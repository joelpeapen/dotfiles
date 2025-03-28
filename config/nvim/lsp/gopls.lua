vim.lsp.config.gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = vim.fs.dirname(
        vim.fs.find({ ".git", "Makefile" }, { upward = true })[1]
    ),
    single_file_support = true,
    settings = {
        gopls = {
            gofumpt = true
        }
    }
}
