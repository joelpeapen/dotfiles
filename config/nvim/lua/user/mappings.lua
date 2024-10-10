MAP = vim.keymap.set

vim.g.mapleader = " "

MAP('n', "Q", "<nop>")

MAP('n', "<esc>", function()
    vim.cmd.norm(":<c-c>")
    vim.cmd.noh()
end)

MAP('n', "<m-q>", function()
    vim.cmd.LspStop()
    vim.cmd.SClose()
end)

-- netrw
MAP('n', "<m-o>", function()
    if vim.bo.filetype ~= "netrw" then
        vim.cmd.Ex()
        vim.cmd.norm("jj")
    else
        vim.cmd.Rex()
    end
end)

-- plugins
MAP('n', "<c-space>p", "<cmd>Lazy home<cr>")

MAP('n', "<leader>2", vim.cmd.so)

-- write and quit
MAP('n', "<leader>w", vim.cmd.w)
MAP('n', "<leader>q", vim.cmd.q)
MAP('n', "<leader>wq", vim.cmd.wq)
MAP('n', "<leader>11", "<cmd>q!<cr>")

-- select all
MAP('n', "<m-a>", "gg_vGg_")

-- insert mode movements
MAP({ 'i', '!' }, "<m-k>", "<up>")
MAP({ 'i', '!' }, "<m-j>", "<down>")
MAP({ 'i', '!' }, "<m-h>", "<left>")
MAP({ 'i', '!' }, "<m-l>", "<right>")
MAP({ 'i', '!' }, "<m-b>", "<c-left>")
MAP({ 'i', '!' }, "<m-f>", "<c-right>")
MAP({ 'i', '!' }, "<c-d>", "<del>")
MAP('!', "<c-b>", "<left>")
MAP('!', "<c-f>", "<right>")

-- start/eol movements
MAP('v', '$', "g_")
MAP({ 'v', 'n' }, '<m-cr>', "g_")
MAP({ 'i', '!' }, "<m-cr>", "<end>")
MAP('i', "<m-s-cr>", "<esc>I")
MAP('!', "<m-s-cr>", "<home>")
MAP({ 'n', 'v' }, "<m-s-cr>", "_")

-- center cursor on jumps
MAP('n', 'G', "Gzz")
MAP('n', "<c-d>", "<c-d>zz")
MAP('n', "<c-u>", "<c-u>zz")
MAP('n', "<c-f>", "<c-f>zz")
MAP('n', "<c-b>", "<c-b>zz")
MAP('n', "<c-o>", "<c-o>zz")
MAP('n', "<c-i>", "<c-i>zz")

-- center cursor when search next instance
MAP('n', 'n', "nzzzv")
MAP('n', 'N', "Nzzzv")

-- horizontal scroll
MAP('n', "<m-9>", "10zh")
MAP('n', "<m-0>", "10zl")
MAP('n', "<m-s-9>", "zH")
MAP('n', "<m-s-0>", "zL")

-- tabs
MAP('n', "<m-.>", "gt")
MAP('n', "<m-,>", "gT")
MAP('n', "<m-t>", vim.cmd.tabnew)
MAP('n', "<m-W>", vim.cmd.bdelete)
MAP('n', "<m-w>", vim.cmd.tabclose)
MAP('n', "<m-S-.>", "<cmd>tabmove +<cr>")
MAP('n', "<m-S-,>", "<cmd>tabmove -<cr>")
MAP('n', "<m-T>", "<c-w>T")

-- pane switching
MAP('n', "<c-j>", "<c-w>j")
MAP('n', "<c-k>", "<c-w>k")
MAP('n', "<c-l>", "<c-w>l")
MAP('n', "<c-h>", "<c-w>h")
MAP('n', "<c-p>", "<c-w>p")

-- pane movements
MAP({ 'n', 't' }, "<c-m-k>", "<c-w>K") -- very top
MAP({ 'n', 't' }, "<c-m-j>", "<c-w>J") -- very bottom
MAP({ 'n', 't' }, "<c-m-h>", "<c-w>H") -- far left
MAP({ 'n', 't' }, "<c-m-l>", "<c-w>L") -- far right

-- pane sizes
MAP('n', "=", "<c-w>+")     -- height++
MAP('n', "-", "<c-w>-")     -- height--
MAP({ 'n', 't' }, "<c-->", "<c-w>>") -- width++
MAP({ 'n', 't' }, "<c-=>", "<c-w><") -- width--

-- splits
MAP('n', "<leader>n", vim.cmd.new)
MAP('n', "<leader>vn", vim.cmd.vne)
MAP('n', "<leader>hs", vim.cmd.split)
MAP('n', "<leader>vs", vim.cmd.vsplit)

-- code folding
MAP('n', "[e", "za")

-- wrap
MAP('n', "||", function()
    vim.wo.wrap = not vim.wo.wrap
    if vim.wo.wrap then
        vim.notify("wrap on", 3)
    else
        vim.notify("wrap off", 3)
    end
end)

-- keep clipboard copy after delete word
MAP('x', "<leader>pp", "\"_dP")

-- delete to void register
MAP({ 'n', 'v' }, "<leader>dd", "\"_d<cr>")

-- copy to system clipboard
MAP({ 'n', 'v' }, "<leader>y", "\"+y")
MAP('n', "<leader>Y", "\"+Y")

-- move lines up and down in visual mode
MAP('v', 'J', ":m '>+1<cr>gv=gv", { silent = true })
MAP('v', 'K', ":m '<-2<cr>gv=gv", { silent = true })

-- replace word
MAP('n', "<leader>s", ":%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<Left><Left><Left>")
MAP('n', "<leader>S", ":%s/\\<<c-r><c-a>\\>/<c-r><c-a>/gI<Left><Left><Left>")

-- nice
local prose = false
MAP('n', "<c-space>w", function()
    if prose then
        vim.wo.wrap = false
        vim.opt_local.spell = false
        vim.opt_local.textwidth = 0
        vim.opt_local.colorcolumn = ""
        prose = false
    else
        vim.wo.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 80
        vim.opt_local.colorcolumn = "80"
        prose = true
    end
end)

-- cd into bufdir
MAP('n', "<leader>cd", function()
    vim.cmd("cd " .. BUFDIR())
end)

-- open cwd in new
MAP('n', "<leader>pt", function() -- terminal tab
    os.execute("newtab " .. os.getenv("TERMINAL") .. " " .. BUFDIR())
end)
MAP('n', "<leader>pT", function() -- tmux window
    os.execute("tmux new-window; cd " .. BUFDIR())
end)

-- file stats
MAP('n', "<leader>4", function()
    local count, lines = vim.fn.wordcount(), vim.api.nvim_buf_line_count(0)
    vim.notify((lines .. " lines -- " ..
        count.words .. " words -- " ..
        count.chars .. " characters"
    ), 3)
end)

-- build file
MAP('n', "<F9>", function()
    os.execute("buildfile " .. FILE())
end)

-- run file
MAP('n', "<F10>", function()
    os.execute("runfile " .. FILE() .. " " .. BUFDIR())
end)
MAP('n', "<S-F10>", function()
    local args = vim.fn.input("args: ")
    os.execute("runfile " .. FILE() .. " " .. BUFDIR() .. " " .. args)
end)

-- color picker
MAP({ 'n', 'v' }, "<leader>qp", function()
    local color = vim.fn.expand("<cWORD>")
    os.execute("zenity --color-selection --color=" .. color)
end)
