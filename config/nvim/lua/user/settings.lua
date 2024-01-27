vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.winbar = "%m"
vim.opt.laststatus = 2
vim.opt.showmode = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.noequalalways = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.whichwrap:append("hl<>[]")

vim.opt.list = true
vim.opt.listchars:append("trail:·", "tab: ")
vim.opt.fillchars = {
    eob = ' ',
    diff = '╱',
    fold = ' ',
    foldsep = ' ',
    foldopen = '',
    foldclose = ''
}

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "split"
vim.opt.nrformats:append("alpha")
vim.opt.completeopt:append("menuone,noselect")
vim.opt.guicursor:append("v-ci:hor100,a:reverse")

vim.opt.backup = false
vim.opt.updatetime = 50
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.path:append("**")
vim.opt.isfname:append("@-@")
vim.opt.shada = "!,'1000,<50,s10,h"

vim.g.netrw_preview = 1
vim.g.netrw_winsize = 30
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- folds
vim.opt.foldcolumn = "0"
vim.opt.foldenable = false
vim.g.markdown_folding = 1

-- treesitter folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- nice
function Prose(o)
    if o then
        vim.wo.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 80
        vim.opt_local.colorcolumn = "80"
    else
        vim.wo.wrap = false
        vim.opt_local.spell = false
        vim.opt_local.textwidth = 0
        vim.opt_local.colorcolumn = ""
    end
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
