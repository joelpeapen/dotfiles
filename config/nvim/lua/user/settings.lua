local o = vim.opt
local g = vim.g

o.number = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.winbar = "%m"
o.laststatus = 2
o.showmode = false

o.splitright = true
o.splitbelow = true
g.noequalalways = true

o.wrap = false
o.linebreak = true
o.smartcase = true
o.ignorecase = true
o.smartindent = true
o.whichwrap:append("hl<>[]")

o.list = true
o.listchars:append("trail:·", "tab: ")
o.fillchars = {
    eob = ' ',
    diff = '╱',
    fold = ' ',
    foldsep = ' ',
    foldopen = '',
    foldclose = ''
}

o.scrolloff = 5
o.signcolumn = "yes"
o.inccommand = "split"
o.nrformats:append("alpha")
o.completeopt:append("menuone,noselect")
o.guicursor:append("v-ci:hor100,a:reverse")

o.backup = false
o.updatetime = 50
o.undofile = true
o.swapfile = false
o.path:append("**")
o.isfname:append("@-@")
o.shada = "!,'1000,<50,s10,h"

g.netrw_preview = 1
g.netrw_winsize = 30
g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- folds
o.foldcolumn = "0"
o.foldenable = false
g.markdown_folding = 1

-- treesitter folds
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = "v:lua.vim.foldtext()"

local function foldtext()
    local l = vim.fn.getline(vim.v.foldstart)
    local folded = vim.v.foldend - vim.v.foldstart
    local text = vim.fn.substitute(l, '^%s*"{\\+', '', 'g')
    local width = vim.bo.textwidth
    local fillcount = width - #text - #tostring(folded)
    return '+' .. string.rep('-', 3) .. ' ' .. text .. string.rep(' ', fillcount) .. ' (' .. folded .. ' lines)'
end

function P(v)
    print(vim.inspect(v))
    return v
end

function FILE()
    return string.gsub(vim.api.nvim_buf_get_name(0), ' ', '\\ ')
end

function BASENAME()
    return string.gsub(tostring(vim.fn.expand("%:p:r")), ' ', '\\ ')
end

function BUFDIR()
    return string.gsub(tostring(vim.fn.expand("%:p:h")), ' ', '\\ ')
end
