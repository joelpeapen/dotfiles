require("toggleterm").setup({
    shading_factor = '-10',
    float_opts = { border = "rounded" }
})

local function custom(cmd)
    return require('toggleterm.terminal').Terminal:new {
        cmd = cmd,
        direction = "float",
        hidden = false
    }
end

local function term(type)
    if ZEN then
        vim.cmd("ToggleTerm dir=" .. BUFDIR() .. " direction=float")
    elseif type == "hor" then
        vim.cmd("ToggleTerm dir=" .. BUFDIR() .. " direction=horizontal")
    elseif type == "vert" then
        vim.cmd("ToggleTerm size=70 dir=" .. BUFDIR() .. " direction=vertical")
    end
end

MAP('t', "<m-Space>", "<c-\\><c-n>");
MAP({ 'n', 't' }, "<m-/>", function() term("hor") end)
MAP({ 'n', 't' }, "<m-\\>", function() term("vert") end)
MAP('n', "<leader>py", function() custom("python3.10"):toggle() end)
MAP('v', "<m-/>", vim.cmd.ToggleTermSendVisualSelection)
