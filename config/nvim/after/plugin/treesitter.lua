require("nvim-treesitter.configs").setup {
    ensure_installed = { 'c', "html", "css", "lua" },
    sync_install = false,
    auto_install = true,
    install = { prefer_git = true },
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
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        }
    }
}

local t = require("treesitter-context")
MAP('n', "[c", t.go_to_context)
t.setup { zindex = 41 }
