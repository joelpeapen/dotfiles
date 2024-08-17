require("fm-nvim").setup({
    ui = {
        float = { border = "rounded" },
        split = { direction = "topleft", size = 24 }
    },
    mappings = {
        ESC        = "<c-c>",
        edit       = "<c-o>",
        horz_split = "<c-x>"
    }
})
MAP('n', "<m-n>", function ()
    local t = vim.bo.filetype
    if t == "startify" or t == "" then
        vim.cmd("Lf " .. BUFDIR())
    else
        vim.cmd("Lf " .. FILE())
    end
end)
