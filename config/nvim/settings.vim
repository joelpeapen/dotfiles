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
set autoread

" By default, Vim doesn't let you hide a buffer
set hidden

set ignorecase
set smartcase
set smarttab
" set indentexpr

" Enable searching as you type, rather than waiting till you press enter.
set incsearch
set hlsearch
set inccommand=nosplit

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

set noerrorbells visualbell t_vb=
set mouse+=a

""""""""CUSTOM FUNCTIONS

" Writer mode
func! WriterMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WM call WriterMode()
