local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function copy_file_to()
        local node = api.tree.get_node_under_cursor()
        local file_src = node['absolute_path']
        local file_out = vim.fn.input("COPY TO: ", file_src, "file")
        local dir = vim.fn.fnamemodify(file_out, ":h")
        vim.fn.system { 'mkdir', '-p', dir }
        vim.fn.system { 'cp', '-R', file_src, file_out }
    end

    api.config.mappings.default_on_attach(bufnr)

    MAP('n', 'u', api.tree.change_root_to_parent, opts('Up'))
    MAP('n', '?', api.tree.toggle_help, opts('Help'))
    MAP('n', 'C', copy_file_to, opts('Copy File To'))

    MAP('n', 'P', function()
        local node = api.tree.get_node_under_cursor()
        print(node.absolute_path)
    end, opts('Print Node Path'))

    MAP('n', 'T', function()
        local node = api.tree.get_node_under_cursor()
        api.node.open.tab(node)
        vim.cmd.tabprev()
    end, opts('Open: Silent Tab'))
end

local function Focus()
    if vim.bo.filetype ~= "NvimTree" then
        vim.cmd("NvimTreeFocus")
    else vim.cmd("wincmd p") end
end
local function Toggle()
    if vim.bo.filetype ~= "NvimTree" then
        vim.cmd("NvimTreeFindFile!")
    else vim.cmd("wincmd p") end
end

if LAYOUT == "colemak" then
    MAP("n", "<M-m>", "<cmd>NvimTreeToggle<cr>")
    MAP("n", "<M-k>", function() Toggle() end)
else
    MAP("n", "<M-e>", "<cmd>NvimTreeToggle<CR>")
    MAP("n", "<M-m>", function() Focus() end)
    MAP("n", "<M-n>", function() Toggle() end)
end

require("nvim-tree").setup({
    on_attach = on_attach,
    sort_by = "case_sensitive",
    hijack_cursor = true,
    hijack_netrw = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = false,
        update_root = true,
    },
    view = {
        adaptive_size = function()
            if not ZEN then
                print("zen is false")
                return true
            else
                print("zen is true")
                return false
            end
        end,
        width = function()
            return math.floor(vim.opt.columns:get() * 0.5)
        end,
        number = true,
        relativenumber = true,
        centralize_selection = false,
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * 0.5
                local window_h = screen_h * 0.8
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
    },
    renderer = {
        group_empty = true,
        indent_markers = { enable = true }
    },
    modified = { enable = true, },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    notify = { threshold = vim.log.levels.ERROR }
})
