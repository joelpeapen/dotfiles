function Pencils(color)
    color = color or vim.g.colors_name
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function NoPencils()
    vim.cmd.colorscheme(vim.g.colors_name)
end

MAP('n', "<leader><leader>t", Pencils)
MAP('n', "<leader><leader>T", NoPencils)

-- css colors
require('nvim-highlight-colors').setup()

------------------------- THEMES ------------------------
vim.cmd("set bg=dark")

require("kanagawa").setup({
    compile = true,
    background = { dark = "dragon" },
    commentStyle = { italic = false },
    keywordStyle = { italic = false },
    colors = { theme = { all = { ui = { bg_gutter = "none" } } } }
})
vim.cmd.colorscheme("kanagawa")
