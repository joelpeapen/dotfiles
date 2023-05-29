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

local function lsp()
    local msg = 'no lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
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

require('lualine').setup({
    theme = function() if (vim.g.colors_name == "gruvbox-material")
        then return 'ayu_dark'
        else return 'auto' end
    end,
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'filename'},
        lualine_b = {'branch', {'diff', source = diff_source}, 'diagnostics'},
        lualine_c = {''},
        lualine_x = { { lsp, icon = '󰒓', color = { fg = '#ff757f'} },
            'filesize', 'fileformat', 'filetype'
        },
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {'branch', {'diff', source = diff_source}, 'diagnostics'},
        lualine_c = {''},
        lualine_x = {'filesize', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    extensions = {
        'nvim-tree', 'man', 'lazy',
        'fugitive', 'trouble',
        'toggleterm', 'nvim-dap-ui'
    }
})
