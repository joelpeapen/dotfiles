local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
ls.config.setup {}

MAP({ 'i', 'v' }, "<m-.>", function() ls.jump(1) end)
MAP({ 'i', 'v' }, "<m-,>", function() ls.jump(-1) end)
