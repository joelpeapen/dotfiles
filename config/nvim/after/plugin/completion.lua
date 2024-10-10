local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources {
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" }
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<c-space>"] = cmp.mapping.complete(),
        ["<m-;>"] = cmp.mapping.select_next_item(),
        ["<m-'>"] = cmp.mapping.select_prev_item(),
        ["<m-space>"] = cmp.mapping.confirm({ select = true }),
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
    sources = ({
        { name = "buffer" },
    })
})
