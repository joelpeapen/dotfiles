OPT = vim.opt

vim.g.nocompatible = true

vim.cmd([[ syntax enable
          syntax on
          filetype plugin on
]])

vim.g.markdown_folding = 1

OPT.guicursor:append("v-ci:hor100,a:reverse")

OPT.nu = true
OPT.relativenumber = true

OPT.showcmd = true
OPT.showmode = false

OPT.winbar = "%m"
OPT.laststatus=2

-- linebreak at spaces
OPT.linebreak = true

-- show trailing spaces
OPT.list = true
OPT.listchars:append("trail:·", "tab: ")

OPT.splitright = true
OPT.splitbelow = true

OPT.smartindent = true
OPT.autoindent = true
OPT.fillchars = { eob = " " }
OPT.ignorecase = true
OPT.smartcase = true

vim.g.noequalalways = true

vim.wo.wrap = false
OPT.scrollopt:append("hor")

-- tabstop
OPT.tabstop = 4
OPT.softtabstop = 4
OPT.shiftwidth = 4
OPT.expandtab = true

-- use OS clipboard
OPT.clipboard:append("unnamedplus")

OPT.path = { ".", ",", ",", "**" }

-- enchance command line completion
OPT.wildmenu = true

OPT.ttyfast = true
OPT.updatetime = 50

vim.cmd('set whichwrap+=h,l,<,>,[,]')
OPT.backspace= { 'indent', 'eol', 'start' }
OPT.autoread = true

OPT.hidden = true
OPT.swapfile = false
OPT.backup = false
OPT.undofile = true

OPT.hlsearch = true
OPT.incsearch = true
OPT.inccommand="nosplit"

OPT.scrolloff = 8
OPT.signcolumn = "yes"
OPT.isfname:append("@-@")

-- folds
OPT.foldmethod = "expr"
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.cmd([[ set nofoldenable
autocmd BufReadPost,FileReadPost * normal zR]])

--OPT.colorcolumn = "80"

-- writer mode
function WriterMode()
    vim.opt_local.textwidth = 80
    vim.opt_local.smartindent= true
    vim.opt_local.spell.spelllang = "en_us"
    OPT.colorcolumn = "80"
    OPT.spell = true
end
-- vim.cmd("au BufEnter *.md,*.rmd,*.Rmd,*.tex,*.qmd,*.txt lua WriterMode()")

--in txt,md... files textwidth and colorcolumn
vim.cmd("au BufEnter *.md,*.rmd,*.Rmd,*.tex,*.qmd,*.txt set textwidth=80")

-- nice
P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

BPATH = function() -- dir/file.ex
    return tostring(vim.api.nvim_buf_get_name(0))
end

BPATHX = function() -- dir/file
    return tostring(vim.api.nvim_buf_get_name(0):match("(.+)%..+$"))
end

BUFDIR = function() -- dir/
    return tostring(vim.api.nvim_buf_get_name(0):match("(.-)[^%/]+$"))
end
