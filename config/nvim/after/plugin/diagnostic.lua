vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = { border = "rounded" },
    jump = { float = true }
})

local trouble = require("trouble")

MAP('n', "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
MAP('n', "<leader>xa", "<cmd>Trouble diagnostics toggle<cr>")

trouble.setup({
    focus = true,
})
