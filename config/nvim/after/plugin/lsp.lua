local cmp = require("cmp")
local lsp = require("lsp-zero").preset("recommended")

local select = { behavior = cmp.SelectBehavior.Select }
cmp.setup {
    view = {
        entries = {
            name = "custom",
            selection_order = "near_cursor"
        }
    },
    sources = cmp.config.sources {
        { name = "path" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" }
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert {
        ["<m-;>"] = cmp.mapping.select_next_item(select),
        ["<m-'>"] = cmp.mapping.select_prev_item(select),
        ["<c-Space>"] = cmp.mapping.complete(),
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
    },
    experimental = { ghost_text = true }
}

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources {
        { name = "path" },
        { name = "cmdline" }
    }
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = ({ { name = "buffer" } })
})

lsp.on_attach(function(client, bufnr)
    local lmap = function(mode, key, func, desc)
        vim.keymap.set(mode, key, func, { buffer = bufnr, desc = desc })
    end
    lmap('n', "gd", vim.lsp.buf.definition, "lsp: go to definition")
    lmap('n', "[d", vim.diagnostic.goto_next, "lsp: next diagnostic")
    lmap('n', "]d", vim.diagnostic.goto_prev, "lsp: prev diagnostic")
    lmap('n', "<leader>ca", vim.lsp.buf.code_action, "lsp: code actions")
    lmap('n', "gi", vim.lsp.buf.implementation, "lsp: go to implementation")
    lmap('n', "<leader>vd", vim.diagnostic.open_float, "lsp: diagnostic float")
    lmap('n', "<leader>ws", vim.lsp.buf.workspace_symbol, "lsp: workspace symbol")
end)

vim.diagnostic.config({
    float = true,
    severity_sort = true
})

local trouble  = require("trouble")
MAP('n', "<leader>tt", vim.cmd.TroubleToggle)
MAP('n', "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
MAP('n', "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>")
MAP('n', "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>") -- better than builtin lookup

MAP('n', "<leader>tn", function()
    trouble.next({ skip_groups = true, jump = true })
end)
MAP('n', "<leader>tp", function()
    trouble.previous({ skip_groups = true, jump = true })
end)

lsp.setup()
trouble.setup()
lsp.nvim_workspace()
