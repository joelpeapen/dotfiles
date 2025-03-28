local lsp = require("lspconfig")

lsp.lua_ls.setup({
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
})

lsp.clangd.setup({})

lsp.gopls.setup({
    settings = {
        gopls = {
            gofumpt = true,
        }
    }
})

lsp.jdtls.setup({})

lsp.ruff.setup({})
lsp.pyright.setup({
    handlers = {
        ["textDocument/publishDiagnostics"] = function() end
    }
})

lsp.bashls.setup({})
lsp.emmet_ls.setup({})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_mappings", {}),
    callback = function(e)
        local opts = { buffer = e.buf }
        MAP('n', "K", vim.lsp.buf.hover, opts)
        MAP('n', "<leader>vd", vim.diagnostic.open_float, opts)

        MAP('n', "[d", vim.diagnostic.goto_next, opts)
        MAP('n', "]d", vim.diagnostic.goto_prev, opts)

        MAP('n', "<F2>", vim.lsp.buf.rename, opts)
        MAP('n', "<F3>", vim.lsp.buf.format, opts)
        MAP('n', "c;", vim.lsp.buf.code_action, opts)

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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
)
