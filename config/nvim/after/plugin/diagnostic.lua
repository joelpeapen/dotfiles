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
