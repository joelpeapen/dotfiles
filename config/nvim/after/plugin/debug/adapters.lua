local dap = require("dap")

local function args()
    local a = vim.fn.input("args: ")
    return a ~= "" and a or {}
end

-- c/c++
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.exepath("codelldb"),
        args = { "--port", "${port}" }
    }
}

dap.configurations.c = {
    {
        name = "Debug file",
        type = "codelldb",
        request = "launch",
        program = "${fileBasenameNoExtension}",
        cwd = "${fileDirname}",
        args = function() return args() end
    },
    {
        name = "Debug file (with path)",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("path: ", BUFDIR() .. '/', "file")
        end,
        cwd = "${fileDirname}",
        args = function() return args() end
    }
}
dap.configurations.cpp = dap.configurations.c

-- go
require("dap-go").setup()
