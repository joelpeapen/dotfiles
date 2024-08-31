vim.diagnostic.config({
    severity_sort = true,
    float = { border = "rounded" }
})

local trouble = require("trouble")

MAP('n', "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
MAP('n', "<leader>xa", "<cmd>Trouble diagnostics toggle<cr>")

trouble.setup({
    focus = true,
})
