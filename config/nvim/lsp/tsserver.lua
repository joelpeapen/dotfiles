vim.lsp.config.tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript" },
    root_dir = vim.fs.dirname(
        vim.fs.find({ ".git", "package.json" }, { upward = true })[1]
    ),
    single_file_support = true
}
