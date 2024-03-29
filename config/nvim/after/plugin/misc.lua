MAP('n', "<leader>gs", vim.cmd.Git)

MAP('n', "<leader>dv", vim.cmd.DiffviewOpen)
MAP('n', "<leader>dV", vim.cmd.DiffviewClose)

MAP('n', "<c-/>", "<Plug>(comment_toggle_linewise_current)")
MAP('v', "<c-/>", "<Plug>(comment_toggle_linewise_visual)")

require("nvim-autopairs").setup({
    ignored_next_char = "[%w%.%'%\"%[%{]",
    fast_wrap = {
        map = "<m-\\>",
        chars = { '{', '[', '(', '"', "'", '<', '`' },
        end_key = " "
    }
})

require("tabline").setup({
    padding = 1,
    separator = '',
    close_icon = '󰅖',
    show_icon = true,
    modified_icon = '',
    color_all_icons = true
})

require("scrollbar").setup({
    hide_if_all_visible = true,
    handle = { blend = 60 },
    excluded_buftypes = { "nofile" }
})

require("ibl").setup({
    scope = { enabled = false },
    exclude = {
        filetypes = {
            "markdown",
            "text",
            "startify"
        }
    }
})

MAP('n', "<m-M>", vim.cmd.TSJToggle)
require("treesj").setup({
    max_join_length = 200,
    use_default_keymaps = false,
})

require("nvim-surround").setup({
    keymaps = {
        insert = "<m-g>s",
        insert_line = "<m-g>S"
    }
})

-- harpoon
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
MAP('n', "<m-r>", mark.add_file)
MAP('n', "<m-v>", ui.toggle_quick_menu)
MAP('n', "<m-H>", function() ui.nav_file(1) end)
MAP('n', "<m-J>", function() ui.nav_file(2) end)
MAP('n', "<m-K>", function() ui.nav_file(3) end)
MAP('n', "<m-L>", function() ui.nav_file(4) end)
require("harpoon").setup({
    save_on_toggle = true,
    menu = { width = vim.api.nvim_win_get_width(0) - 4 }
})

-- undotree
vim.g.undotree_WindowLayout = 2
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1
MAP('n', "<leader>u", vim.cmd.UndotreeToggle)

require('hologram').setup({
    auto_display = true
})

-- scrolling
require("neoscroll").setup({
    mappings = {
        "<m-e>", "<m-n>",
        "<m-f>", "<m-h>",
        "zt", "zz", "zb"
    }
})
require("neoscroll.config").set_mappings({
    ["<m-h>"] = { "scroll", { "0.10", "false", "100", nil } },
    ["<m-;>"] = { "scroll", { "-0.10", "false", "100", nil } },
    ["<m-j>"] = { "scroll", { "vim.wo.scroll", "true", "100", nil } },
    ["<m-k>"] = { "scroll", { "-vim.wo.scroll", "true", "100", nil } }
})

require("zen-mode").setup({
    window = { backdrop = 0.85 },
    options = { number = true, relativenumber = true },
    plugins = { options = { enabled = true, ruler = true } },
    on_open = function() ZEN = true end,
    on_close = function() ZEN = false end
})
MAP('n', "<leader>z", vim.cmd.ZenMode)
