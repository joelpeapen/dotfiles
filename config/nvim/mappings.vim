" Mappings

" set leader
let mapleader = "\<Space>"

"alt-h to remove highlight after search
map <A-h> :noh<CR>

"alt-enter to end of line in insert mode
imap <A-CR> <Esc>$a

"ctrl-shift-d to duplicate line
"map <C-S-d> yyp

" nvim write and quit shortcuts
nnoremap <Leader>q :q<CR>
nnoremap <Leader>11 :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>w :w<CR>

" tabs
nnoremap <A-t>     :tabnew<CR>
nnoremap <A-w>     :tabclose<CR>
nmap <leader>l gt
nmap <leader>h gT

" pane switching
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" splits
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>vh :split<CR>

"NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeVCS<CR>
map <A-e> :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<CR>
