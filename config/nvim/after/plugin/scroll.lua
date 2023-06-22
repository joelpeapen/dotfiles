require('neoscroll').setup({
    mappings = {'<A-e>', '<A-n>', '<A-f>', '<A-h>', 'zt', 'zz', 'zb'},
    hide_cursor = true,
    stop_eof = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing_function = "sine",
    pre_hook = nil,
    post_hook = nil,
    performance_mode = false
})

-- t[keys] = {function, {args}}
local t = {}
t['<M-j>'] = {'scroll', { 'vim.wo.scroll', 'true', '100', [['sine']]}}
t['<M-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '100', [['sine']]}}
t['<M-f>'] = {'scroll', {'-0.10', 'false', '100', nil}}
t['<M-h>'] = {'scroll', { '0.10', 'false', '100', nil}}

t['zt'] = {'zt', {'300'}}
t['zz'] = {'zz', {'300'}}
t['zb'] = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)
