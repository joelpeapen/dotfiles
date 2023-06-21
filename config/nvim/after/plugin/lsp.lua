local lsp = require('lsp-zero').preset("recommended")
local lspconfig = require('lspconfig')

-- lsp.ensure_installed({'clangd'})

-- servers
lsp.nvim_workspace({
    library = vim.api.nvim_get_runtime_file('', true)
})

-- completion
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<M-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<M-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<M-u>"] = cmp.mapping.scroll_docs(-4),
    ["<M-d>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup {
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' },
    },
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    experimental = {
        ghost_text = true
    },
}

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' },
        { name = 'help' },
    })
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig['clangd'].setup { capabilities = capabilities }
lspconfig['pyright'].setup { capabilities = capabilities }
lspconfig['bashls'].setup { capabilities = capabilities }

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    MAP("n", "gd", function() vim.lsp.buf.definition() end, opts)
    MAP("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    MAP("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    MAP("n", "gh", function() vim.lsp.buf.hover() end, opts)
    MAP("n", "<leader>gH", function() vim.lsp.buf.signature_help() end, opts)
    MAP("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    MAP("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    MAP("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    MAP("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    MAP("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    MAP("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
    MAP("n", "<leader>S", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
    severity_sort = true,
    float = true
})

require("trouble").setup()

MAP("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
MAP("n", "<leader>wx", "<cmd>TroubleToggle workspace_diagnostics<cr>")
MAP("n", "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>")
MAP("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
MAP("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")
MAP("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")
