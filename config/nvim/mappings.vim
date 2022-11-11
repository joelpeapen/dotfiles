" Mappings

" set leader
let mapleader = "\<Space>"

"alt-h to remove highlight after search
map <A-h> :noh<CR>

"Normal tab mappings
nnoremap <A-t>     :tabnew<CR>
nnoremap <A-q>     :tabclose<CR>

" tabs
nmap <leader>l gt
nmap <leader>h gT

" splits
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>vh :split<CR>

"NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
map <A-e> :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<CR>

" nvim write and quit shortcuts
nnoremap <Leader>q :q<CR>
nnoremap <Leader>11 :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>w :w<CR>

" pane switching
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
