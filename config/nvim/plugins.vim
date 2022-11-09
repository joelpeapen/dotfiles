call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"UTIL
""""""
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"or use coq.nvim

"Language packs
Plug 'sheerun/vim-polyglot'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Telescope
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

"THEMES
"""""""
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'

Plug 'sainnhe/gruvbox-material'


"FILE manager
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m pip install chadtree && python -m pip chadtree deps'}

Plug 'preservim/nerdtree'

"Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

call plug#end()
