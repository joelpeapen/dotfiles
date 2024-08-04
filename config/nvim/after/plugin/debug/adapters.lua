local dap = require("dap")

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
        stopOnEntry = false,
        args = {}
    },
    {
        name = "Debug file (with path)",
        type = "codelldb",
        request = "launch",
        program = function()
            vim.fn.input("path: ", BUFDIR() .. '/', "file")
        end,
        cwd = "${fileDirname}",
        stopOnEntry = false,
        args = {}
    }
}
dap.configurations.cpp = dap.configurations.c

-- go
require("dap-go").setup()
