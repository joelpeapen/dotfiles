local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    api.config.mappings.default_on_attach(bufnr)

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

    local function move_file_to()
        local node = api.tree.get_node_under_cursor()
        local file_src = node['absolute_path']
        local file_out = vim.fn.input("MOVE TO: ", file_src, "file")
        local dir = vim.fn.fnamemodify(file_out, ":h")
        vim.fn.system { 'mkdir', '-p', dir }
        vim.fn.system { 'mv', file_src, file_out }
    end

    local function printpath()
        local node = api.tree.get_node_under_cursor()
        print(node.absolute_path)
    end

    local function silenttab()
        local node = api.tree.get_node_under_cursor()
        api.node.open.tab(node)
        vim.cmd.tabprev()
    end

    MAP('n', 'C', copy_file_to, opts('Copy File To'))
    MAP('n', 'X', move_file_to, opts('Move File To'))
    MAP('n', '?', api.tree.toggle_help, opts('Help'))
    MAP('n', ';', api.tree.change_root_to_parent, opts('Up'))
    MAP('n', 'l', api.node.open.edit, opts('Open'))
    MAP('n', 'h', api.node.navigate.parent_close, opts('Parent dir'))
    MAP('n', 'gY', function() printpath() end)
    MAP('n', 'T', function() silenttab() end)
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

MAP("n", "<M-e>", "<cmd>NvimTreeToggle<CR>")
MAP("n", "<M-m>", function() Focus() end)
MAP("n", "<M-n>", function() Toggle() end)

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
        adaptive_size = true,
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
    renderer = { indent_markers = { enable = true } },
    modified = { enable = true, },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    notify = { threshold = vim.log.levels.ERROR }
})
