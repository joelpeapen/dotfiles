require("lf").setup({
    border = "rounded",
    mappings = true,
    focus_on_open = true,
    height = vim.fn.float2nr(vim.fn.round(0.85 * vim.o.lines)),
    width = vim.fn.float2nr(vim.fn.round(0.90 * vim.o.columns)),
})
vim.keymap.set("n", "<m-n>", vim.cmd.Lf)
