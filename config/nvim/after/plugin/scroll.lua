require('neoscroll').setup({
    mappings = --[[ function()
        if LAYOUT == "colemak" then
            return ]] {'<A-e>', '<A-n>', '<A-f>', '<A-h>', 'zt', 'zz', 'zb'},
        --[[ else
            return {'<A-k>', '<A-j>', '<A-f>', '<A-h>', 'zt', 'zz', 'zb'}
        end
    end, ]]
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
if LAYOUT == "colemak" then
    t['<M-n>'] = {'scroll', { 'vim.wo.scroll', 'true', '100', [['sine']]}}
    t['<M-e>'] = {'scroll', {'-vim.wo.scroll', 'true', '100', [['sine']]}}
    t['<M-t>'] = {'scroll', {'-0.10', 'false', '100', nil}}
    t['<M-h>'] = {'scroll', { '0.10', 'false', '100', nil}}
else
    t['<M-j>'] = {'scroll', { 'vim.wo.scroll', 'true', '100', [['sine']]}}
    t['<M-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '100', [['sine']]}}
    t['<M-f>'] = {'scroll', {'-0.10', 'false', '100', nil}}
    t['<M-h>'] = {'scroll', { '0.10', 'false', '100', nil}}
end

t['zt'] = {'zt', {'300'}}
t['zz'] = {'zz', {'300'}}
t['zb'] = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)
