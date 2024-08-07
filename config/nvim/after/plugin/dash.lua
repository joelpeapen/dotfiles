vim.g.startify_update_oldfiles = 1
vim.g.startify_session_autoload = 1
vim.g.startify_session_persistence = 1
vim.cmd([[
    let g:startify_lists = [
    \    { "type": "files",     "header": [''] },
    \    { "type": "sessions",  "header": [''] }
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
    \ '    \__\/        ¯¯¯¯                       \__\/    '
    \]

    let g:startify_custom_header = startify#center(i)
]])
MAP('n', "<leader><BS>", vim.cmd.Startify)
