local cmp = require("cmp")
local lsp = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "bashls", "clangd" },
    handlers = {
        function(server)
            lsp[server].setup({})
        end,

        ["lua_ls"] = function()
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
        end
    }
})

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources {
        { name = "path" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" }
    },
    formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, item)
            local n = entry.source.name
            if n == "nvim_lsp" then
                item.menu = "[LSP]"
            elseif n == "nvim_lua" then
                item.menu = "[nvim]"
            else
                item.menu = string.format('[%s]', n)
            end
            return item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<c-Space>"] = cmp.mapping.complete(),
        ["<m-;>"] = cmp.mapping.select_next_item(),
        ["<m-'>"] = cmp.mapping.select_prev_item(),
        ["<m-Space>"] = cmp.mapping.confirm({ select = true }),
        ["<m-d>"] = cmp.mapping.scroll_docs(4),
        ["<m-u>"] = cmp.mapping.scroll_docs(-4),
        ["<m-o>"] = function()
            if cmp.visible_docs() then
                cmp.close_docs()
            else
                cmp.open_docs()
            end
        end
    })
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = ({
        { name = "path" },
        { name = "cmdline" }
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = ({ { name = "buffer" } })
})

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

vim.diagnostic.config({
    severity_sort = true,
    float = { border = "rounded" }
})

local trouble = require("trouble")
MAP('n', "<leader>tt", vim.cmd.TroubleToggle)
MAP('n', "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>")
MAP('n', "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>") -- better than builtin lookup
MAP('n', "<leader>tn", function() trouble.next({ skip_groups = true, jump = true }) end)
MAP('n', "<leader>tp", function() trouble.previous({ skip_groups = true, jump = true }) end)

trouble.setup()
