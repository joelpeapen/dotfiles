MAP = vim.keymap.set

vim.g.mapleader = " "

MAP('n', "Q", "<nop>")
MAP('n', "<esc>", ":<c-c>")
MAP('n', "<m-q>", function()
    vim.cmd([[LspStop
    SClose]])
end)

-- netrw
MAP('n', "<m-i>", function ()
    if vim.bo.filetype ~= "netrw" then
        vim.cmd[[ Ex
        norm jj]]
    else
        vim.cmd("Rex")
    end
end)

-- plugins
MAP('n', "<c-Space>p", "<cmd>Lazy home<cr>")

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

-- center cursor when search next instance
MAP('n', 'n', "nzzzv")
MAP('n', 'N', "Nzzzv")

-- keep clipboard copy after delete word
MAP('x', "<leader>pp", "\"_dP")

-- delete to void register
MAP({ 'n', 'v' }, "<leader>dd", "\"_d<cr>")

-- copy to system clipboard
MAP({ 'n', 'v' }, "<leader>y", "\"+y")
MAP('n', "<leader>Y", "\"+Y")

-- code folding
MAP('n', "[e", "za")

-- horizontal scroll
MAP('n', "<m-9>", "10zh")
MAP('n', "<m-0>", "10zl")
MAP('n', "<m-s-9>", "zH")
MAP('n', "<m-s-0>", "zL")

-- move lines up and down in visual mode
MAP('v', 'J', ":m '>+1<cr>gv=gv", { silent = true })
MAP('v', 'K', ":m '<-2<cr>gv=gv", { silent = true })

-- tabs
MAP('n', "<m-.>", "gt")
MAP('n', "<m-,>", "gT")
MAP('n', "<m-t>", vim.cmd.tabnew)
MAP('n', "<m-W>", vim.cmd.bdelete)
MAP('n', "<m-w>", vim.cmd.tabclose)
MAP('n', "<m-S-.>", "<cmd>tabmove +<cr>")
MAP('n', "<m-S-,>", "<cmd>tabmove -<cr>")
MAP('n', "<m-T>", "<cmd>wincmd T<cr>")

-- pane switching
MAP('n', "<c-k>", "<cmd>wincmd k<cr>")
MAP('n', "<c-h>", "<cmd>wincmd h<cr>")
MAP('n', "<c-l>", "<cmd>wincmd l<cr>")
MAP('n', "<c-p>", "<cmd>wincmd p<cr>")
MAP({ 'n', 't' }, "<c-j>", "<cmd>wincmd j<cr>")

-- pane movements
MAP({ 'c', 't' }, "<c-m-K>", "<cmd>wincmd K<cr>") -- very top
MAP({ 'n', 't' }, "<c-m-J>", "<cmd>wincmd J<cr>") -- very bottom
MAP({ 'n', 't' }, "<c-m-H>", "<cmd>wincmd H<cr>") -- far left
MAP({ 'n', 't' }, "<c-m-L>", "<cmd>wincmd L<cr>") -- far right

-- pane sizes
MAP('n', "=", "<cmd>wincmd +<cr>")     -- height++
MAP('n', "-", "<cmd>wincmd -<cr>")     -- height--
MAP({ 'n', 't' }, "<c-->", "<cmd>wincmd ><cr>") -- width++
MAP({ 'n', 't' }, "<c-=>", "<cmd>wincmd <<cr>") -- width--

-- splits
MAP('n', "<leader>n", vim.cmd.new)
MAP('n', "<leader>vn", vim.cmd.vne)
MAP('n', "<leader>hs", vim.cmd.split)
MAP('n', "<leader>vs", vim.cmd.vsplit)

-- wrap
MAP('n', "||", function()
    vim.wo.wrap = not vim.wo.wrap
    if vim.wo.wrap then
        print("wrap on")
    else
        print("wrap off")
    end
end)

-- cd into bufdir
MAP('n', "<leader>cd", "<cmd>lua vim.cmd(\"cd \" .. BUFDIR())<cr>")

-- open cwd in new
MAP('n', "<leader>pt", function() -- terminal tab
    os.execute("newtab " .. os.getenv("TERMINAL") .. " " .. BUFDIR())
end)
MAP('n', "<leader>pT", function() -- tmux window
    os.execute("tmux new-window; cd " .. BUFDIR())
end)

MAP('n', "<c-Space>w", "<cmd>lua Prose(true)<cr>")
MAP('n', "<c-Space>W", "<cmd>lua Prose(false)<cr>")

-- source file
MAP('n', "<leader>2", function()
    if vim.bo.filetype == "lua" then
        vim.cmd([[ so
            norm zx
            norm zR
        ]]) -- stop folding
    end
end)

-- replace word
MAP('n', "<leader>s", ":%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<Left><Left><Left>")
MAP('n', "<leader>S", ":%s/\\<<c-r><c-a>\\>/<c-r><c-a>/gI<Left><Left><Left>")

-- color picker. will be deprecated eventually
MAP({ 'n', 'v' }, "<leader>qp", function()
    local color = vim.fn.expand("<cWORD>")
    os.execute("zenity --color-selection --color=" .. color)
end)

-- build file
MAP('n', "<F9>", function()
    os.execute("buildfile " .. FILE())
end)

-- file stats
MAP('n', "<leader>4", function()
    local count, lines = vim.fn.wordcount(), vim.api.nvim_buf_line_count(0)
    vim.notify((lines .. " lines -- " ..
        count.words .. " words -- " ..
        count.chars .. " characters"
    ), vim.log.levels.WARN)
end)
