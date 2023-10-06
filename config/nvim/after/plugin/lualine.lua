local function lsp()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

require("lualine").setup({
    theme = "auto",
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { "startify" }
    },
    sections = {
        lualine_a = { { "filename", color = { gui = "bold" } } },
        lualine_b = {
            { "branch", color = { fg = "#c099ff" } },
            { "diff",   source = diff_source },
            "diagnostics"
        },
        lualine_c = { nil },
        lualine_x = {
            { lsp, icon = '󰒓', color = { fg = '#f7768e' } },
            { "filesize" },
            { "filetype", color = { fg = "#7e9cd8" } }
        },
        lualine_z = { { "location", color = { gui = "bold" } } }
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {
            { "branch", color = { fg = "#c099ff" } },
            { "diff",   source = diff_source },
            "diagnostics"
        },
        lualine_c = { nil },
        lualine_x = {
            { "filesize" },
            { "filetype", color = { fg = "#7e9cd8" } }
        }
    },
    extensions = {
        "nvim-tree", "nvim-dap-ui",
        "fugitive", "lazy", "toggleterm",
        "trouble", "quickfix", "man"
    }
})
