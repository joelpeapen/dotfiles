local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.setup {}

MAP({ 'i', 'v' }, "<m-.>", function() ls.jump(1) end)
MAP({ 'i', 'v' }, "<m-,>", function() ls.jump(-1) end)

ls.add_snippets("java", {
    s("outf", fmt("System.out.printf(\"{}\", {});{}", { i(1), i(2), i(0) })),
    s("outfe", fmt("System.err.printf(\"{}\", {});{}", { i(1), i(2), i(0) })),
})
