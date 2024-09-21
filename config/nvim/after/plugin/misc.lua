require("neogit").setup()
MAP('n', "<leader>gs", vim.cmd.Neogit)

MAP('n', "<leader>do", vim.cmd.DiffviewOpen)
MAP('n', "<leader>dO", vim.cmd.DiffviewClose)

MAP('n', "<c-/>", "<Plug>(comment_toggle_linewise_current)")
MAP('v', "<c-/>", "<Plug>(comment_toggle_linewise_visual)")

require("fidget").setup()

require("tabline").setup({
    padding = 1,
    separator = '',
    close_icon = '󰅖',
    show_icon = true,
    modified_icon = '',
    no_name = "untitled",
    color_all_icons = true
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

require("nvim-surround").setup({
    keymaps = {
        insert = "<m-g>s",
        insert_line = "<m-g>S"
    }
})

local autopairs = require("nvim-autopairs")
autopairs.setup({
    ignored_next_char = "[%w%.%'%\"%(%)%[%]%{%}%$]",
    fast_wrap = {
        map = "<m-\\>",
        chars = { '{', '[', '(', '"', "'", '<', '`' },
        end_key = " "
    }
})
autopairs.remove_rule('`')

require("treesj").setup({
    max_join_length = 200,
    use_default_keymaps = false
})
MAP('n', "<m-m>", vim.cmd.TSJToggle)

-- harpoon
local hp = require("harpoon")
hp:setup({
    settings = { sync_on_ui_close = true }
})

MAP('n', "<m-r>", function() hp:list():add() end)
MAP('n', "<m-v>", function() hp.ui:toggle_quick_menu(hp:list()) end)
MAP('n', "<m-J>", function() hp:list():select(1) end)
MAP('n', "<m-K>", function() hp:list():select(2) end)
MAP('n', "<m-L>", function() hp:list():select(3) end)
MAP('n', "<m-s-;>", function() hp:list():select(4) end)
MAP('n', "<m-s-p>", function() hp:list():prev() end)
MAP('n', "<m-s-n>", function() hp:list():next() end)

-- undotree
vim.g.undotree_WindowLayout = 2
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1
MAP('n', "<leader>u", vim.cmd.UndotreeToggle)

-- scrolling
local ns = require("neoscroll")
ns.setup(
    { mappings = {} }
)
MAP({ 'n', 'v', 'x' }, "<m-j>", function() ns.ctrl_d({ duration = 50 }) end)
MAP({ 'n', 'v', 'x' }, "<m-k>", function() ns.ctrl_u({ duration = 50 }) end)
MAP({ 'n', 'v', 'x' }, "<m-e>", function() ns.scroll(0.1, { move_cursor=false, duration = 100 }) end)
MAP({ 'n', 'v', 'x' }, "<m-i>", function() ns.scroll(-0.1, { move_cursor=false, duration = 100 }) end)

require("zen-mode").setup({
    options = {
        number = true,
        relativenumber = true,
    },
    window = { backdrop = 0.85 },
    plugins = { options = { enabled = true, ruler = true } },
    on_open = function() ZEN = true end,
    on_close = function() ZEN = false end
})
MAP('n', "<leader>z", vim.cmd.ZenMode)
