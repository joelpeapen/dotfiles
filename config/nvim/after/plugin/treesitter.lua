require'nvim-treesitter.configs'.setup {
    ensure_installed = { "html", "css", "javascript", "python", "c", "cpp", "lua", "vim"},
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    autotag = { enable = true },
}

require'treesitter-context'.setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
}
