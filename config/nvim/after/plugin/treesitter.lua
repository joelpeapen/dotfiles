require("nvim-treesitter.configs").setup({
    auto_install = true,
    sync_install = false,
    install = { prefer_git = true },
    ensure_installed = { 'c', "html", "css", "lua" },
    indent = { enable = true },
    autotag = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-s>",
            node_incremental = "<a-n>",
            node_decremental = "<a-p>",
            scope_incremental = "<a-s>"
        }
    },
    refactor = {
        highlight_definitions = { enable = true },
        navigation = {
            enable = true,
            keymaps = {
                goto_next_usage = "[g",
                goto_previous_usage = "]g",
                list_definitions_toc = "g0"
            }
        }
    },
    textobjects = {
        enable = true,
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { ['[m'] = '@function.outer' },
            goto_previous_start = { [']m'] = '@function.outer' },
            goto_next_end = { ['[M'] = '@function.outer' },
            goto_previous_end = { [']M'] = '@function.outer' }
        },
        lsp_interop = {
            enable = true,
            border = "rounded",
            peek_definition_code = {
                ["<leader>k"] = "@function.outer"
            }
        }
    }
})

local t = require("treesitter-context")
MAP('n', "[c", t.go_to_context)
t.setup { zindex = 41 }
