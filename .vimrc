set nocompatible

" source ~/.vim/plugins.vim
" source ~/.vim/lightline.vim
" source ~/.vim/mappings.vim
" source ~/.vim/settings.vim
" source ~/.vim/ui.vim

"""""""""""""""
" PLUGIN MANAGER PATHOGEN
"execute pathogen#infect()

"COLORS
""""""""""""""""""""""""""""""""
syntax enable

" Turn on syntax highlighting.
syntax on

" Vim Script
"colorscheme tokyonight

" There are also colorschemes for the different styles
"colorscheme tokyonight-night
"colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon


"""""""""""""""""""""""""""""""""
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


" Writer mode
func! WriterMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WM call WriterMode()
