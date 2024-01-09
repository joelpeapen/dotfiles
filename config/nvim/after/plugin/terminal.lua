local function term(type)
    if ZEN then
        vim.cmd("ToggleTerm dir=" .. BUFDIR() .. " direction=float")
    elseif type == "hor" then
        vim.cmd("ToggleTerm dir=" .. BUFDIR() .. " direction=horizontal")
    elseif type == "vert" then
        vim.cmd("ToggleTerm size=70 dir=" .. BUFDIR() .. " direction=vertical")
    end
end

local function custom(cmd)
    return require('toggleterm.terminal').Terminal:new {
        cmd = cmd,
        direction = "float",
        hidden = false
    }
end

local gitui = custom("gitui")
local python = custom("python3.10")

MAP('t', "<m-Space>", "<c-\\><c-n>");
MAP({ 'n', 't' }, "<m-/>", function() term("hor") end)
MAP({ 'n', 't' }, "<m-\\>", function() term("vert") end)
MAP('n', "<leader>gu", function() gitui:toggle() end)
MAP('n', "<leader>py", function() python:toggle() end)
MAP('v', "<m-/>", vim.cmd.ToggleTermSendVisualSelection)
MAP('v', "<m-\\>", vim.cmd.ToggleTermSendVisualSelection)

require("toggleterm").setup({
    shading_factor = '-10',
    float_opts = { border = "rounded" }
})
