vim.lsp.config.emmet_ls = {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = { "astro", "css", "eruby",
        "html", "htmldjango", "javascriptreact",
        "less", "pug", "sass", "scss", "svelte",
        "typescriptreact", "vue", "htmlangular",
    },
    single_file_support = true
}
