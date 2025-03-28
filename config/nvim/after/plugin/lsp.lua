vim.lsp.config('*', {
    root_markers = { '.git' }
})

vim.lsp.enable({
    "clangd", "gopls", "jdtls", "lua_ls",
    "ruff", "pyright", "emmet_ls", "bashls"
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_mappings", {}),
    callback = function(e)
        local opts = { buffer = e.buf }

        MAP('n', "<F2>", vim.lsp.buf.rename, opts)
        MAP('n', "<F3>", vim.lsp.buf.format, opts)
        MAP('n', "c;", vim.lsp.buf.code_action, opts)
        MAP('n', "<leader>vd", vim.diagnostic.open_float, opts)

        MAP('n', "gr", vim.lsp.buf.references, opts)
        MAP('n', "gd", vim.lsp.buf.definition, opts)
        MAP('n', "gi", vim.lsp.buf.implementation, opts)
        MAP('n', "<space>D", vim.lsp.buf.type_definition, opts)
        MAP('n', "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

        MAP('n', "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        MAP('n', "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        MAP('n', "<space>wl", function()
            P(vim.lsp.buf.list_workspace_folders())
        end, opts)
    end
})
