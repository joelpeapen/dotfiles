local telescope = require("telescope")
local config = require("telescope.config")
local builtin = require("telescope.builtin")
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Clone the default config
local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden") -- dot files
table.insert(vimgrep_arguments, "--glob") -- no `.git` dirs
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        vimgrep_arguments = vimgrep_arguments,
        layout_strategy = "flex",
        sorting_strategy = "ascending",
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        undo = {
            layout_strategy = "horizontal",
            layout_config = {
                preview_height = 0.8,
            },
        },
    },
})

-- find files
MAP('n', "<leader>f", function()
    if vim.bo.filetype ~= "startify" then
        vim.cmd(("Telescope find_files theme=dropdown cwd=path"):gsub('path', BUFDIR))
    end
end)
MAP("n", "<leader><leader>f", ":Telescope find_files theme=dropdown<CR>", SILENT)
MAP('n', "<C-F>", "<cmd>Telescope current_buffer_fuzzy_find theme=dropdown<CR>")

-- buffers
MAP('n', "<leader>3", function() builtin.buffers {
    attach_mappings = function(prompt_bufnr, mapp)
        local delete_buf = function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.api.nvim_buf_delete(selection.bufnr, { force = true })
        end
        mapp('n', 'u', delete_buf)
        return true
    end
} end)

MAP('n', "<leader>tl", builtin.live_grep)
MAP('n', "<leader>tL", function()
    builtin.grep_string({ search = vim.fn.input("live grep > ") });
end)

MAP('n', "<leader>to", builtin.oldfiles)
MAP('n', "<leader>th", builtin.help_tags)
MAP('n', "<leader>tm", builtin.man_pages)
MAP('n', "<leader>td", builtin.diagnostics)

MAP('n', "<leader>tgf", builtin.git_files)
MAP('n', "<leader>tgc", builtin.git_commits)
MAP('n', "<leader>tgb", builtin.git_branches)
MAP('n', "<leader>tgs", builtin.git_status)

-- nice
MAP('n', "<C-Space>t", function() builtin.colorscheme({enable_preview = true}) end)
MAP("n", "<M-p>", "<cmd>Telescope commands theme=ivy<CR>")
MAP('n', "<leader>tk", function() builtin.keymaps() end)
MAP('n', "<leader>tu", "<cmd>Telescope undo<CR>")
MAP('n', "<leader>cs", builtin.spell_suggest)

-- code places
MAP('n', "<leader>`", function() builtin.find_files({cwd = "~/"}) end)
MAP('n', "<leader>7", function() builtin.find_files({cwd = "~/.zsh/"}) end)
MAP('n', "<leader>8", function() builtin.find_files({cwd = "~/.config/nvim/"}) end)
MAP('n', "<leader>9", function() builtin.find_files({cwd = "~/Documents/academics/code/c/"}) end)
MAP('n', "<leader>0", function() builtin.find_files({cwd = "~/Documents/academics/code/c++/"}) end)

require("telescope").load_extension("fzf")
require("telescope").load_extension("undo")
