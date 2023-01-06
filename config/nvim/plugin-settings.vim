" NERDTree

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" set working directory to buffer directory
autocmd BufEnter * lcd %:p:h

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif
    
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" NERDTree to split model
let NERDTreeHijackNetrw=1
" let NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=40

"icons
let g:NERDTreeDirArrowExpandable = '◉'
let g:NERDTreeDirArrowCollapsible = '㋣'

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"----------------------------------------------

" Treesitter
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = { "python"}, -- one of "all", "maintained"
"  ignore_install = { "javascript"}, -- List of parsers to ignore installing
"  highlight = {
"   enable = true,              -- false will disable the whole extension
"   disable = { "c", "rust", "r" },  -- list of language that will be disabled
"   additional_vim_regex_highlighting = false,
" },
" indent = {
"   enable = true,              -- false will disable the whole extension
"   disable = { "python", "c", "rust" },  -- list of language that will be disabled
"   additional_vim_regex_highlighting = false,
" },
" incremental_selection = {
"   enable = true,              -- false will disable the whole extension
"   disable = { "c", "rust" },  -- list of language that will be disabled
"   additional_vim_regex_highlighting = false,
" },
" refactor = {
"   highlight_definitions = { enable = true },
"   navigation = {
"       \ enable = true,
"       keymaps = {
"           \ goto_definition = "gnd",
"           list_definitions = "gnD",
"           list_definitions_toc = "g0",
"           goto_next_usage = "<a-*>",
"           goto_previous_usage = "<a-#>",
"         \ }
"     \ }
" },
"}
"EOF
"----------------------------------------------

" nvim-notify
lua << EOF
vim.notify = require("notify")
EOF
"----------------------------------------------

" Telescope
"lua << EOF
" require('telescope').setup{
"   defaults = {
"     -- Default configuration for telescope goes here:
"     -- config_key = value,
"     mappings = {
"       i = {
"         -- map actions.which_key to <C-h> (default: <C-/>)
"         -- actions.which_key shows the mappings for your picker,
"         -- e.g. git_{create, delete, ...}_branch for the git_branches picker
"         ["<C-h>"] = "which_key"
"       }
"     }
"   },
"   pickers = {
"     -- Default configuration for builtin pickers goes here:
"     -- picker_name = {
"     --   picker_config_key = value,
"     --   ...
"     -- }
"     -- Now the picker_config_key will be applied every time you call this
"     -- builtin picker
"   },
"   extensions = {
"     -- Your extension configuration goes here:
"     -- extension_name = {
"     --   extension_config_key = value,
"     -- }
"     -- please take a look at the readme of the extension you want to configure
"   }
" }
"EOF
"----------------------------------------------
