vim.lsp.config.emmet_ls = {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = {
        "astro", "eruby", "html",
        "htmldjango",  "htmlangular",
        "typescriptreact", "javascriptreact",
        "less", "pug", "svelte",  "vue",
    },
    single_file_support = true
}
