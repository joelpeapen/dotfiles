local function on_attach(bufnr)
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    local function copy_file_to()
        local node = api.tree.get_node_under_cursor()
        local file_src = node["absolute_path"]
        local file_out = vim.fn.input("COPY TO: ", file_src, "file")
        local dir = vim.fn.fnamemodify(file_out, ":h")
        vim.fn.system { "mkdir", "-p", dir }
        vim.fn.system { "cp", "-R", file_src, file_out }
    end

    local function move_file_to()
        local node = api.tree.get_node_under_cursor()
        local file_src = node["absolute_path"]
        local file_out = vim.fn.input("MOVE TO: ", file_src, "file")
        local dir = vim.fn.fnamemodify(file_out, ":h")
        vim.fn.system { "mkdir", "-p", dir }
        vim.fn.system { "mv", file_src, file_out }
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

    MAP('n', 'l', api.node.open.edit, opts("Open"))
    MAP('n', "<esc>", api.tree.close, opts("Close"))
    MAP('n', 'T', function() silenttab() end, opts("Open: New Tab Silent"))
    MAP('n', 'C', copy_file_to, opts("Copy File To"))
    MAP('n', 'X', move_file_to, opts("Move File To"))
    MAP('n', ',', api.tree.change_root_to_parent, opts("Up"))
    MAP('n', ';', api.node.navigate.parent, opts("Parent Directory"))
    MAP('n', 'h', api.node.navigate.parent_close, opts("Close to Parent"))
    MAP('n', "gY", function() printpath() end, opts("Absolute Path"))
    MAP('n', '?', api.tree.toggle_help, opts("Help"))
end

local function size()
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
        border = "rounded",
        relative = "editor",
        row = center_y,
        col = center_x,
        width = window_w_int,
        height = window_h_int
    }
end

local function Tree(t)
    if vim.bo.filetype ~= "NvimTree" then
        vim.cmd(t and "NvimTreeFocus" or "NvimTreeFindFile")
    else
        vim.cmd("wincmd p")
    end
end

MAP('n', "<m-m>", function() Tree(true) end)
MAP('n', "<m-n>", function() Tree(false) end)

require("nvim-tree").setup({
    on_attach = on_attach,
    hijack_cursor = true,
    hijack_netrw = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    update_focused_file = { update_root = true },
    view = {
        number = true,
        relativenumber = true,
        adaptive_size = true,
        float = { enable = true, open_win_config = size },
        width = function()
            return math.floor(vim.opt.columns:get() * 0.5)
        end
    },
    modified = { enable = true, },
    notify = { threshold = vim.log.levels.ERROR },
    renderer = { indent_markers = { enable = true } },
    diagnostics = { enable = true, show_on_dirs = true }
})

require("fm-nvim").setup {
    ui = {
        float = { border = "rounded" },
        split = { direction = "topleft", size = 24 }
    },
    mappings = {
        ESC        = "<c-c>",
        edit       = "<c-o>",
        horz_split = "<c-x>"
    }
}
MAP('n', "<m-e>", function ()
    if vim.bo.filetype ~= "startify" then
        vim.cmd("Lf %:p")
    else
        vim.cmd("Lf ~")
    end
end)
