local dap = require("dap")

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
        name = "launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            local a = vim.fn.input("1. single\n2. custom\ntype number: ")
            if a == "1" then
                return BASENAME()
            elseif a == "2" then
                return vim.fn.input("Debug file: ", vim.fn.getcwd() .. '/', "file")
            end
        end,
        cwd = "${fileDirname}",
        stopOnEntry = false,
        args = {}
    }
}
dap.configurations.cpp = dap.configurations.c

dap.defaults.fallback.external_terminal = {
    command = vim.fn.exepath("kitty")
}
dap.defaults.fallback.force_external_terminal = true

MAP('n', "<F5>", dap.continue)
MAP('n', "<F6>", dap.step_over)
MAP('n', "<F7>", dap.step_into)
MAP('n', "<F8>", dap.step_out)
MAP('n', "<leader>db", dap.toggle_breakpoint)
MAP('n', "<leader>dr", dap.repl.open)
MAP('n', "<leader>dl", dap.run_last)
MAP('n', "<leader>B", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
MAP({ 'n', 'v' }, "<leader>dh", function()
    require("dap.ui.widgets").hover()
end)
MAP({ 'n', 'v' }, "<leader>dp", function()
    require("dap.ui.widgets").preview()
end)
MAP('n', "<leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end)
MAP('n', "<leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)

local dapclose = vim.api.nvim_create_augroup("dapclose", {})
vim.api.nvim_create_autocmd({ "Filetype" }, {
    pattern = "dap-float",
    group = dapclose,
    command = "nnoremap <buffer><silent> q <cmd>close!<cr>"
})

---------------------DAPUI---------------------
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup()

dapui.setup({
    layouts = {
        {
            elements = {
                { id = "watches", size = 0.1 },
                { id = "scopes",  size = 0.6 },
                { id = "repl",    size = 0.3 }
            },
            size = 49,
            position = "left"
        }
    }
})

MAP('n', "<leader>od", dapui.toggle)
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●" })
sign("DapBreakpointCondition", { text = "●" })
sign("DapLogPoint", { text = "◆" })
