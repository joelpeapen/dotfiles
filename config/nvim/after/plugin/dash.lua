local function padding()
    if vim.fn.winwidth > 100 then
        return 50 else return 5
    end
end

vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1
vim.g.startify_update_oldfiles = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_use_env = 0
vim.g.startify_padding_left = tonumber(padding) -- TODO: find why !work
vim.cmd([[
    let g:startify_lists = [
    \ { 'type': 'files',     'header': [''] },
    \ { 'type': 'sessions',  'header': [''] },
    \ ]

    let i = [
    \ '    /¯¯/\          ___         ___          /¯¯/\    ',
    \ '    \¯¯\:\        /\__\       /  /\        /  /::|   ',
    \ '     \  \:\      /:/  /      /  /:/       /  /:|:|   ',
    \ ' _____\__\:\    /:/  /      /__/::\      /  /:/|:|__ ',
    \ '/__/::::::::\  /:/__/  ___  \__\/\:\__  /__/:/_|::::\',
    \ '\  \:\~~\__\/  |:|  | /\__\    \  \:\/\ \__\/  /~~/:/',
    \ ' \  \:\        |:|  |/:/  /     \__\::/       /  /:/ ',
    \ '  \  \:\       |:|__/:/  /      /__/:/       /  /:/  ',
    \ '   \  \:\       \::::/__/       \__\/       /__/:/   ',
    \ '    \__\/        ¯¯¯¯                       \__\/    ',
    \]

    let g:startify_custom_header = startify#center(i)
]])
