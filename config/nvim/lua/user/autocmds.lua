local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local auGroups = augroup("mine", {})

autocmd({ "BufReadPost" }, {
    group = auGroups,
    callback = function()
        vim.cmd([[ norm zx
        norm zR ]])
    end
})

autocmd({ "Filetype" }, {
    group = auGroups,
    pattern = { "markdown", "text" },
    callback = function()
        vim.wo.wrap = true
        vim.opt_local.textwidth = 80
    end
})

-- remove trailing spaces
autocmd({ "BufWritePre" }, {
    group = auGroups,
    pattern = '*',
    command = [[%s/\s\+$//e]]
})

-- tabs to spaces
autocmd({ "BufWritePre" }, {
    group = auGroups,
    pattern = '*',
    command = "retab"
})
