vim.lsp.config.clangd = {
    cmd = { "clangd" },
    filetypes = { 'c', "cpp" },
    root_dir = vim.fs.dirname(
        vim.fs.find({ ".git", "Makefile" }, { upward = true })[1]
    ),
    single_file_support = true
}
