-- transparent
TRANS = false
function Pencils(color)
    TRANS = true
    color = color or vim.g.colors_name
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function NoPencils() TRANS = false vim.cmd.colors(vim.g.colors_name) end

vim.keymap.set("n", "<leader><leader>t", function() Pencils() end)
vim.keymap.set("n", "<leader><leader>T", function() NoPencils() end)

-- css colors
vim.cmd("set termguicolors")
require('colorizer').setup(nil, { css = true; })

------------------------------------------------- THEMES
vim.cmd("set background=dark")
if (vim.g.background =='dark') then
    vim.g.gruvbox_material_background = 'hard'
end

if (vim.g.colors_name == "gruvbox-material") then
    vim.g.gruvbox_material_transparent_background = 2
    Pencils()
end

vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'

vim.cmd([[
    let g:gruvbox_material_colors_override = {
       \ 'bg_dim':           ['#1f2223', '232'],
       \ 'bg0':              ['#1f2223', '234'],
       \ 'bg_statusline1':   ['#2f2d2c', '235'],
       \ 'bg_statusline2':   ['#1f2233', '235'],
       \ 'bg_statusline3':   ['#2f2d2c', '239'],
  \ }
]])

require("tokyonight").setup({
    style = "night",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    styles = {
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf", "help" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = true
})

require('rose-pine').setup({
    variant = 'moon',
    dark_variant = 'moon',
    bold_vert_split = false,
    dim_nc_background = true,
    disable_background = false,
    disable_float_background = false,
    disable_italics = true,

    groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        }
    },
    highlight_groups = {
        ColorColumn = { bg = 'rose' },
        CursorLine = { bg = 'foam', blend = 10 },
        StatusLine = { fg = "love", bg = "love", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },
    }
})

require("dap")
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

vim.cmd.colorscheme("tokyonight")
