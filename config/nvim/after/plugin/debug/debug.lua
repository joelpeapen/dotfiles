local dap = require("dap")

dap.defaults.fallback.external_terminal = {
    command = vim.fn.exepath("kitty")
}
dap.defaults.fallback.force_external_terminal = true

MAP('n', "<F5>", dap.continue)
MAP('n', "<F6>", dap.step_over)
MAP('n', "<F7>", dap.step_into)
MAP('n', "<F8>", dap.step_out)

MAP('n', "<leader>db", dap.toggle_breakpoint)
MAP('n', "<leader>dB", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

MAP('n', "<space>?", function()
    require("dapui").eval(nil, { enter = true })
end)

MAP('n', "<leader>dr", dap.repl.open)
MAP('n', "<leader>dl", dap.run_last)

local dapclose = vim.api.nvim_create_augroup("dapclose", {})
vim.api.nvim_create_autocmd({ "Filetype" }, {
    pattern = "dap-float",
    group = dapclose,
    command = "nnoremap <buffer><silent> q <cmd>close!<cr>"
})
