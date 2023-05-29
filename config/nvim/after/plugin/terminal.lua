local Terminal  = require('toggleterm.terminal').Terminal

local function horizontal()
    if not ZEN then
        vim.cmd(("ToggleTerm dir=p direction=horizontal"):gsub('p', BUFDIR))
    else
        vim.cmd(("ToggleTerm dir=p direction=float"):gsub('p', BUFDIR))
    end
end

local function vertical()
    if not ZEN then
        vim.cmd(("ToggleTerm size=70 dir=p direction=vertical"):gsub('p', BUFDIR))
    else
        vim.cmd(("ToggleTerm dir=p direction=float"):gsub('p', BUFDIR))
    end
end

local gitui = Terminal:new({
    cmd = "gitui",
    direction= "float",
    float_opts = { border = "double" },
    hidden = false
})

MAP("t", "<esc>", "<C-\\><C-n>");
MAP({"n", "t"}, "<M-\\>", function() vertical() end)
MAP({"n", "t"}, "<M-/>", function() horizontal() end)
MAP("n", "<leader>gi", function() gitui:toggle() end)
MAP("v", "<M-/>", "<cmd>ToggleTermSendVisualSelection<cr>")
MAP("v", "<M-\\>", "<cmd>ToggleTermSendVisualSelection<cr>")

require'toggleterm'.setup({
    open_mapping =  nil,
    hide_numbers = true,
    autochdir = false,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    close_on_exit = true,
    shading_factor = '10'
})
