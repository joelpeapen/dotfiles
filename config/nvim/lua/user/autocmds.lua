local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local auGroups = augroup("mine", {})

-- format on save
autocmd({ "BufWritePre" }, {
    group = auGroups,
    pattern = "go",
    callback = function()
        vim.lsp.buf.format()
    end
})

-- tabs to spaces
autocmd({ "BufWritePre" }, {
    group = auGroups,
    pattern = '*',
    command = "retab"
})

-- remove trailing spaces
autocmd({ "BufWritePre" }, {
    group = auGroups,
    pattern = '*',
    command = [[%s/\s\+$//e]]
})

-- prose
autocmd({ "Filetype" }, {
    group = auGroups,
    pattern = { "markdown", "text" },
    callback = function()
        vim.wo.wrap = true
        vim.opt_local.textwidth = 80
    end
})
