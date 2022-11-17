set nocompatible

syntax enable

" Turn on syntax highlighting.
syntax on

" show commands
set showcmd

" linebreak at spaces
set linebreak

"in txt,md... files textwidth and colorcolumn
au BufEnter *.md,*.rmd,*.Rmd,*.tex,*.qmd,*.txt set textwidth=80

"show trailing spaces
set list
set listchars=tab:\ \ ,trail:·

" set split on right and below
set splitright
set splitbelow

" indent
set smartindent
set autoindent
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2

"tabstop
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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
set cursorline

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
set inccommand=nosplit

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

set noerrorbells visualbell t_vb=
set mouse+=a

""""""""""""" NERDTree"""""""""""
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

""""""""""""""""""""""""""""""""""""""

"Telescope
""""""""""
" Show all builtin pickers
":Telescope
"
"" Tab completion
":Telescope |<tab>
":Telescope find_files
"
"" Setting options
":Telescope find_files prompt_prefix=🔍

""""""""CUSTOM FUNCTIONS

" Writer mode
func! WriterMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WM call WriterMode()
