local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup()
local widgets = require("dap.ui.widgets")

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

MAP({ 'n', 'v' }, "<leader>dh", function() widgets.hover() end)
MAP({ 'n', 'v' }, "<leader>dp", function() widgets.preview() end)
MAP('n', "<leader>df", function() widgets.centered_float(widgets.frames) end)
MAP('n', "<leader>ds", function() widgets.centered_float(widgets.scopes) end)

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●" })
sign("DapBreakpointCondition", { text = "●" })
sign("DapLogPoint", { text = "◆" })
