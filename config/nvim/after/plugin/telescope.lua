local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        mappings = {
            n = { ['u'] = actions.delete_buffer }
        }
    },
    pickers = {
        fd = {
            theme = "dropdown",
            hidden = true
        },
        current_buffer_fuzzy_find = {
            theme = "dropdown"
        },
        colorscheme = {
            theme = "dropdown",
            enable_preview = true
        },
        commands = { theme = "ivy" },
        command_history = { theme = "ivy" }
    }
})

-- find files
MAP('n', "<leader>f", function()
    builtin.fd({ cwd = BUFDIR() })
end)

-- search
MAP('n', "<m-f>", builtin.current_buffer_fuzzy_find)
MAP('n', "<m-V>", "<cmd>Telescope harpoon marks<cr>")

-- grep
MAP('n', "<leader>lG", builtin.live_grep) -- vim dir
MAP('n', "<leader>lg", function()
    builtin.live_grep({ cwd = BUFDIR() })
end)
MAP('n', "<leader>lv", function()
    builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
MAP('n', "<leader>ls", builtin.grep_string)
MAP('n', "<leader>lS", function() -- more of current word
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end)

MAP('n', "<leader>pf", builtin.git_files)
MAP('n', "<leader>ps", builtin.git_status)
MAP('n', "<leader>pc", builtin.git_commits)
MAP('n', "<leader>pb", builtin.git_branches)

MAP('n', "<m-p>", builtin.commands)
MAP('n', "<m-o>", builtin.command_history)
MAP('n', "<leader>3", builtin.buffers)
MAP('n', "<leader>tk", builtin.keymaps)
MAP('n', "<leader>of", builtin.oldfiles)
MAP('n', "<leader>th", builtin.help_tags)
MAP('n', "<leader>tm", builtin.man_pages)
MAP('n', "<leader>cs", builtin.spell_suggest)
MAP('n', "<c-Space>t", builtin.colorscheme)

-- places
MAP('n', "<leader>6", function()
    builtin.find_files({
        cwd = "~/.local/share/nvim",
    })
end)
MAP('n', "<leader>8", function()
    builtin.find_files({
        search_dirs = { "~/.zsh", "~/.config/nvim" }
    })
end)
MAP('n', "<leader>9", function()
    builtin.find_files({
        search_dirs = {
            "~/Documents/academics/code/c",
            "~/Documents/academics/code/c++"
        }
    })
end)

telescope.load_extension("harpoon")
