MAP = vim.keymap.set
SILENT = { silent = true }

-- set leader
vim.g.mapleader=" "

MAP("i", "<M-8>", "<ESC>")

MAP("n", "Q", "<nop>")

-- startify
MAP("n", "<leader><BS>", ":Startify<CR>", SILENT)
MAP("n", "<M-q>", function ()
    vim.cmd([[NvimTreeClose
              LspStop
              SClose]])
end, SILENT)

-- source file
MAP("n", "<leader>2", function()
    if (vim.bo.filetype == "lua") then
        vim.cmd("so") end
end, SILENT)

-- netrw
MAP("n", "<leader>pv", ":Ex<CR>", SILENT)

-- plugins
MAP("n", "<C-Space>p", ":Lazy home<CR>", SILENT)

-- alt-enter to EOL
MAP("i", "<M-CR>", "<ESC>$a")
MAP("n", "<M-CR>", "$a")
MAP("v", "$", "$<Left>") -- !copy EOL char

-- wrap
MAP("n", "||", ":set wrap!<CR>", SILENT)

-- format
MAP("v", "<leader>v", "=")

if LAYOUT == "colemak" then
    MAP("v", "N", ":m '>+1<CR>gv=gv")
    MAP("v", "E", ":m '<-2<CR>gv=gv")

    MAP({"n", "v"}, "N", "mzJ`z")
else
    -- move lines up and down in visual mode
    MAP("v", "J", ":m '>+1<CR>gv=gv")
    MAP("v", "K", ":m '<-2<CR>gv=gv")

    MAP("n", "J", "mzJ`z") -- join bottom line
end

-- select all
MAP("n", "<M-a>", "ggVG")

-- center cursor when C-d, C-u
MAP("n", "<C-d", "<C-d>zz")
MAP("n", "<C-u", "<C-u>zz")
MAP("n", "G", "Gzz") -- center EOF jump

-- center cursor when search next instance
MAP("n", "n", "nzzzv")
MAP("n", "N", "Nzzzv")

-- preserve clipboard copy after delete word
MAP("x", "<leader>p", "\"_dP")

-- delete to void register
MAP("n", "<leader>dd", "\"_d<CR>")
MAP("v", "<leader>dd", "\"_d<CR>")

-- copy to system clipboard
MAP("n", "<leader>y", "\"+y")
MAP("v", "<leader>y", "\"+y")
MAP("n", "<leader>Y", "\"+Y")

-- cole folding
MAP("n", "<leader>>", ":foldopen<CR>", SILENT)
MAP("n", "<leader><", ":foldclose<CR>", SILENT)

-- horizontal scroll
MAP("n", "<M-9>", "zhzhzhzhzhzhzhzhzhzh")
MAP("n", "<M-0>", "zlzlzlzlzlzlzlzlzlzl")

-- write and quit
MAP("n", "<Leader>wq", ":wq<CR>", SILENT)
MAP("n", "<Leader>w", ":w<CR>")
MAP("n", "<Leader>q", ":q<CR>", SILENT)
MAP("n", "<Leader>11", ":q!<CR>", SILENT)

-- tabs
MAP("n", "<M-.>", "gt", SILENT)
MAP("n", "<M-,>", "gT", SILENT)
MAP("n", "<M-S-.>", ":tabmove +<CR>", SILENT)
MAP("n", "<M-S-,>", ":tabmove -<CR>", SILENT)
MAP("n", "<M-t>", ":tabnew<CR>", SILENT)
MAP("n", "<M-W>", ":bdelete<CR>", SILENT)
MAP("n", "<M-w>", ":tabclose<CR>", SILENT)
MAP("n", "<M-T>", ":wincmd T<CR>", SILENT)

if LAYOUT == "colemak" then
    MAP({"n", "t"}, "<C-e>", "<cmd>wincmd k<CR>", SILENT)
    MAP({"n", "t"}, "<C-n>","<cmd>wincmd j<CR>", SILENT)
    MAP({"n", "t"}, "<C-h>", "<cmd>wincmd h<CR>", SILENT)
    MAP("n", "<C-i>", "<cmd>wincmd l<CR>", SILENT)

    MAP({"n", "t"}, "<C-M-E>", "<cmd>wincmd K<CR>", SILENT)
    MAP({"n", "t"}, "<C-M-N>", "<cmd>wincmd J<CR>", SILENT)
    MAP({"n", "t"}, "<C-M-H>", "<cmd>wincmd H<CR>", SILENT)
    MAP({"n", "t"}, "<C-M-I>", "<cmd>wincmd L<CR>", SILENT)
else
    -- pane switching
    MAP({"n", "t"}, "<C-k>", "<cmd>wincmd k<CR>", SILENT)
    MAP({"n", "t"}, "<C-j>","<cmd>wincmd j<CR>", SILENT)
    MAP({"n", "t"}, "<C-h>", "<cmd>wincmd h<CR>", SILENT)
    MAP("n", "<C-l>", "<cmd>wincmd l<CR>", SILENT)

    -- pane movements
    MAP({"n", "t"}, "<C-M-K>", "<cmd>wincmd K<CR>", SILENT) -- very top
    MAP({"n", "t"}, "<C-M-J>", "<cmd>wincmd J<CR>", SILENT) -- very bottom
    MAP({"n", "t"}, "<C-M-H>", "<cmd>wincmd H<CR>", SILENT) -- far left
    MAP({"n", "t"}, "<C-M-L>", "<cmd>wincmd L<CR>", SILENT) -- far right
end
MAP("n", "<C-p>", ":wincmd p<CR>", SILENT)

MAP("n", "=", "<cmd>wincmd +<CR>", SILENT) -- height++
MAP("n", "-", "<cmd>wincmd -<CR>", SILENT) -- height++
MAP("n", "{", "<cmd>wincmd ><CR>", SILENT) -- width++
MAP("n", "}", "<cmd>wincmd <<CR>", SILENT) -- width--
MAP("n", "<leader>=", "<cmd>wincmd =<CR>", SILENT) -- equal size

-- splits
MAP("n", "<leader>n", "<cmd>new<CR>", SILENT)
MAP("n", "<leader>vn", "<cmd>vne<CR>", SILENT)
MAP("n", "<leader>vs", "<cmd>vsplit<CR>", SILENT)
MAP("n", "<leader>hs", "<cmd>split<CR>", SILENT)

-- replace word
MAP("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- make file executable
MAP("n", "<leader><leader>x", "<cmd>!chmod +x %<CR>", SILENT)
MAP("n", "<leader><leader>X", "<cmd>!chmod -x %<CR>", SILENT)

-- open cwd in new kitty tab
MAP("n", "<leader>pt", function()
    os.execute(("kitty @launch --to unix:/tmp/mykitty --type=tab --cwd='dir'"):gsub('dir', BUFDIR))
end)

-- open cwd in new tmux window
MAP("n", "<leader>pT", function()
    os.execute(("tmux new-window; cd dir"):gsub('dir', BUFDIR))
end)

-- file stats
MAP({"n"}, "<leader>4", function()
    local count, lines = vim.fn.wordcount(), vim.api.nvim_buf_line_count(0)
    vim.notify((lines .. " lines -- " .. count.words .. " words -- " .. count.chars .. " characters"), vim.log.levels.WARN)
end)

-- build file
MAP("n", "<F7>", function()
    if vim.bo.filetype == 'c' then
        vim.cmd(("!gcc -std=c18 file dotc -o file -lm"):gsub('file', BPATHX):gsub(' dotc', ".c"))
    elseif vim.bo.filetype == "cpp" then
        vim.cmd(("!g++ -Wall -std=c++17 -o file file dotp"):gsub('file', BPATHX):gsub(' dotp', ".cpp"))
    else
        vim.notify("invalid filetype", vim.log.levels.WARN)
    end
end)

-- colemak
-- MAP("n", "<leader><leader>c", function()
    LAYOUT = ""
--     MAP({"n", "v"}, "n", "j")
--     MAP({"n", "v"}, "k", "n")
--
--     MAP({"n", "v"}, "e", "k")
--     MAP({"n", "v"}, "m", "e")
--
--     MAP({"n", "v"}, "i", "l")
--     MAP({"n", "v"}, "u", "i")
--     MAP({"n", "v"}, "l", "u")
--
--     MAP("n", "<M-:>", "<cmd>Telescope commands theme=ivy<CR>")
--     vim.cmd([[ so ~/.config/nvim/lua/user/mappings.lua
--     so ~/.config/nvim/after/plugin/filexplorer.lua
--     so ~/.config/nvim/after/plugin/scroll.lua
--     ]])
-- end)
--
-- MAP("n", "<leader><leader>C", function()
--     LAYOUT = "qwerty"
--
--     MAP({"n", "v"}, "n", "j") -- n+ = j
--
--     MAP({"n", "v"}, "m", "e") -- m = e
--     MAP({"n", "v"}, "e", "k") -- e+ = k
--     MAP({"n", "v"}, "e", "m") -- e- = m
--
--     MAP({"n", "v"}, "i", "l") -- i = l
--     MAP({"n", "v"}, "u", "i") -- u = i
--     MAP({"n", "v"}, "l", "u") -- l = u
--
--     MAP("n", "<M-p>", "<cmd>Telescope commands theme=ivy<CR>")
--     vim.cmd([[ so ~/.config/nvim/lua/user/mappings.lua
--     so ~/.config/nvim/after/plugin/filexplorer.lua
--     so ~/.config/nvim/after/plugin/scroll.lua
--     ]])
-- end)
