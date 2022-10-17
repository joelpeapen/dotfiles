" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).

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

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" set indentexpr

" Enable searching as you type, rather than waiting till you press enter.
set incsearch
set hlsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" Enable mouse support.
set mouse+=a

" """""""""""""""""""""""""""""
" TO SET RUNTIME FOR ctrlp.vim [not needed if PATHOGEN.vim is installed]
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" Run at Vim's command line:  
" :helptags ~/.vim/bundle/ctrlp.vim/doc
" Restart Vim and check :help ctrlp.txt for usage instructions and configuration details. 

" """""""""""""""""""""""""""""
" TO SET RUNTIME FOR Vim plugin for the Perl module / CLI script 'ack' 
set runtimepath^=~/.vim/bundle/ack.vim

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
