vim.lsp.config.cssls = {
    cmd = { "css-languageserver", "--stdio" },
    filetypes = { "css", "scss", "less" },
    init_options = { provideFormatter = true },
    root_dir = vim.fs.dirname(
        vim.fs.find({ ".git" }, { upward = true })[1]
    ),
    single_file_support = true,
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true }
    }
}
