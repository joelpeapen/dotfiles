set nocompatible

syntax enable

" Turn on syntax highlighting.
syntax on

" show commands
set showcmd

" linebreak at spaces
set linebreak

"tabstop
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set textwidth=80

"use OS clipboard
set clipboard=unnamed

"enhance command line completion
set wildmenu

" Optimize for fast terminal connections
set ttyfast

" Disable the default Vim startup message.f
set shortmess+=I

" Show line numbers.
set number
set relativenumber

set laststatus=2

set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer
set hidden

set ignorecase
set smartcase
" set indentexpr

" Enable searching as you type, rather than waiting till you press enter.
set incsearch
set hlsearch

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

set noerrorbells visualbell t_vb=
set mouse+=a

""""""""""""" NERDTree """""""""""""
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" set working directory to buffer directory
" autocmd BufEnter * lcd %:p:h

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
 "    \ quit | endif
    
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" NERDTree to split model
let NERDTreeHijackNetrw=1
" let NERDTreeQuitOnOpen=1

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tokyonight

"require("tokyonight").setup({
"  -- your configuration comes here
"  -- or leave it empty to use the default settings
"  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
"  light_style = "day", -- The theme is used when the background is set to light
"  transparent = false, -- Enable this to disable setting the background color
"  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
"  styles = {
"    -- Style to be applied to different syntax groups
"    -- Value is any valid attr-list value for `:help nvim_set_hl`
"    comments = { italic = true },
"    keywords = { italic = true },
"    functions = {},
"    variables = {},
"    -- Background styles. Can be "dark", "transparent" or "normal"
"    sidebars = "dark", -- style for sidebars, see below
"    floats = "dark", -- style for floating windows
"  },
"  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
"  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
"  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
"  dim_inactive = false, -- dims inactive windows
"  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
"
"  --- You can override specific color groups to use other groups or a hex color
"  --- function will be called with a ColorScheme table
"  ---@param colors ColorScheme
"  on_colors = function(colors) end,
"
"  --- You can override specific highlights to use other groups or a hex color
"  --- function will be called with a Highlights and ColorScheme table
"  ---@param highlights Highlights
"  ---@param colors ColorScheme
"  on_highlights = function(highlights, colors) end,
"})
"
""""""""""""""""""""
"
"
"" coc
"""""""""""""""""""""""""""""""""
"" May need for vim (not neovim) since coc.nvim calculate byte offset by count
"" utf-8 byte sequence.
"set encoding=utf-8
"" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup
"
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
"set updatetime=300
"
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: There's always complete item selected by default, you may want to enable
"" no select by `"suggest.noselect": true` in your configuration file.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
"" Make <CR> to accept selected completion item or notify coc.nvim to format
"" <C-g>u breaks current undo, please make your own choice.
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif
"
"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call ShowDocumentation()<CR>
"
"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Run the Code Lens action on the current line.
"nmap <leader>cl  <Plug>(coc-codelens-action)
"
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"
"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
"
"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocActionAsync('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"
"autocmd FileType json syntax match Comment +\/\/.\+$+
"
""barbar
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Move to previous/next
"nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
"nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
"" Re-order to previous/next
"nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
"nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
"" Goto buffer in position...
"nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
"nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
"nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
"nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
"nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
"nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
"nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
"nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
"nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
"nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
"" Pin/unpin buffer
"nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
"" Close buffer
"nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
"" Wipeout buffer
""                          :BufferWipeout
"" Close commands
""                          :BufferCloseAllButCurrent
""                          :BufferCloseAllButVisible
""                          :BufferCloseAllButPinned
""                          :BufferCloseAllButCurrentOrPinned
""                          :BufferCloseBuffersLeft
""                          :BufferCloseBuffersRight
"" Magic buffer-picking mode
"nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
"" Sort automatically by...
"nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
"nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
"nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
"nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
"
"" Other:
"" :BarbarEnable - enables barbar (enabled by default)
"" :BarbarDisable - very bad command, should never be used
""""""""""""""""""""""""""""""""""""""""""""""



" Writer mode
func! WriterMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WM call WriterMode()
