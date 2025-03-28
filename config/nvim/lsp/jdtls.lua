vim.lsp.config.jdtls = {
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_dir = vim.fs.dirname(
        vim.fs.find({ ".git" }, { upward = true })[1]
    ),
    single_file_support = true,
    init_options = {
        bundles = {
            -- vim.fn.glob(os.getenv("HOME") .. path to jar)
        }
    }
}
