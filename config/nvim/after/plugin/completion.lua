require("blink.cmp").setup({
    snippets = { preset = "luasnip" },
    signature = {
        enabled = true,
        window = { border = "rounded" }
    },
    completion = {
        menu = {
            -- border = "rounded",
            draw = {
                columns = {
                    { "label", "label_description" },
                    { "kind_icon", "kind", gap = 1 }
                }
            }
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 300,
            window = { border = "rounded" }
        }
    },
    keymap = {
        ["<m-space>"] = { "accept", "fallback" },
        ["<m-'>"] = { "select_prev", "fallback" },
        ["<m-;>"] = { "select_next", "fallback" },
        ["<m-o>"] = { "show_documentation", "hide_documentation" },
        ["<m-u>"] = { "scroll_documentation_up", "fallback" },
        ["<m-d>"] = { "scroll_documentation_down", "fallback" }
    }
})
