require("lf").setup({
    border = "rounded",
    mappings = true,
    focus_on_open = true,
    width = math.floor((vim.o.columns * 0.8)),
    height = math.floor((vim.o.lines * 0.8))
})
vim.keymap.set("n", "<m-n>", vim.cmd.Lf)
