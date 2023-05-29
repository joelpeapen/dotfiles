-- FUGITIVE
MAP("n", "<leader>gs", vim.cmd.Git)

require('gitsigns').setup()

require("Comment").setup()
MAP('n', '<C-\\>', '<Plug>(comment_toggle_linewise_current)')
MAP('v', '<C-\\>', '<Plug>(comment_toggle_linewise_visual)')

-- images
-- require('hologram').setup{
--     auto_display = true
-- }

require("scrollbar").setup({
    hide_if_all_visible = true,
    handle = { blend = 0 },
    handlers = { gitsigns = false },
    excluded_buftypes = {
        "nofile",
        "terminal"
    },
})

require("nvim-autopairs").setup({
    ignored_next_char = "[%w%.%'%\"%{]",
    enable_check_bracket_line = false,
    fast_wrap = {
        map = "<M-\\>",
        chars = { '{', '[', '(', '"', "'", '<' },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = " ",
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
})

require("indent_blankline").setup {
    show_current_context = false, -- shiny scope line
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    space_char_blankline = " ",
    -- char_blankline = " ",
    filetype_exclude = { "startify", "help" }
}
vim.api.nvim_create_autocmd("CursorMoved", { command = "IndentBlanklineRefresh"})

-- HARPOON
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
MAP("n", "<leader>a", mark.add_file)
MAP("n", "<M-v>", ui.toggle_quick_menu)
MAP("n", "<leader>!", function() ui.nav_file(1) end)
MAP("n", "<leader>@", function() ui.nav_file(2) end)
MAP("n", "<leader>#", function() ui.nav_file(3) end)
MAP("n", "<leader>$", function() ui.nav_file(4) end)

-- UNDOTREE
vim.g.undotree_WindowLayout = 2
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1
MAP("n", "<leader>u", vim.cmd.UndotreeToggle)

require("zen-mode").setup({
    window = {
        backdrop = 0.85, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 0.7,
        height = 1,
    },
    options = {
        number = true,
        relativenumber = true,
    },
    plugins = {
        options = { enabled = true, ruler = true, showcmd = true },
        gitsigns = { enabled = true },
    },
    on_open = function() -- transparent
        ZEN = true
        vim.cmd("so ~/.config/nvim/after/plugin/terminal.lua")
    end,
    on_close = function()
        ZEN = false
        vim.cmd("so ~/.config/nvim/after/plugin/terminal.lua")
    end,
})
MAP("n", "<leader>z", "<cmd>ZenMode<CR>", SILENT)

-- notify
-- vim.notify = require("notify")
-- vim.notify.setup({
--     render = "minimal",
--     stages = "static",
--     timeout = 5000,
-- })
