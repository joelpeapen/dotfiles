local function diff()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local function lsp()
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then return "" end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, vim.bo.filetype) ~= -1 then
            return client.name
        end
    end
    return ""
end

require("lualine").setup({
    theme = "auto",
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { "startify" }
    },
    sections = {
        lualine_a = {
            { "filename", color = { gui = "bold" } },
        },
        lualine_b = {
            { "branch", color = { fg = "#c099ff" } },
            { "diff",   source = diff },
            "diagnostics",
            "filesize"
        },
        lualine_c = { },
        lualine_x = {
            { lsp, icon = '󰒓', color = { fg = '#f7768e' } },
            { "filetype", color = { fg = "#7e9cd8" } }
        },
        lualine_z = {
            { "location", color = { gui = "bold" } },
        }
    },
    inactive_sections = {
        lualine_b = {
            { "branch", color = { fg = "#c099ff" } },
            { "diff",   source = diff },
            "diagnostics",
        },
        lualine_x = {
            { "filetype", color = { fg = "#7e9cd8" } }
        }
    },
    extensions = {
        "nvim-dap-ui", "fugitive", "lazy",
        "toggleterm", "trouble", "quickfix", "man",
    }
})
