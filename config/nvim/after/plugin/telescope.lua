local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

telescope.setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        layout_strategy = "flex",
        sorting_strategy = "ascending"
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
    }
})

MAP('n', "<leader><leader>f", builtin.fd)
MAP('n', "<leader>f", function()
    builtin.fd({ cwd = BUFDIR() })
end)
MAP('n', "<m-F>", builtin.current_buffer_fuzzy_find)
MAP('n', "<m-V>", "<cmd>Telescope harpoon marks<cr>")

-- buffers
MAP('n', "<leader>3", function()
    builtin.buffers {
        attach_mappings = function(prompt_bufnr, map)
            local delete_buf = function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.api.nvim_buf_delete(selection.bufnr, { force = true })
            end
            map('n', 'u', delete_buf)
            return true
        end
    }
end)

MAP('n', "<leader>lG", builtin.live_grep)
MAP('n', "<leader>lg", function()
    builtin.live_grep({ cwd = BUFDIR() })
end)
MAP('n', "<leader>li", function()
    builtin.grep_string({
        cwd = BUFDIR(),
        search = vim.fn.input("live grep > ")
    })
end)

MAP('n', "<leader>pf", builtin.git_files)
MAP('n', "<leader>ps", builtin.git_status)
MAP('n', "<leader>pc", builtin.git_commits)
MAP('n', "<leader>pb", builtin.git_branches)

MAP('n', "<m-p>", builtin.commands)
MAP('n', "<leader>tk", builtin.keymaps)
MAP('n', "<leader>of", builtin.oldfiles)
MAP('n', "<leader>th", builtin.help_tags)
MAP('n', "<leader>tm", builtin.man_pages)
MAP('n', "<leader>td", builtin.diagnostics)
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
