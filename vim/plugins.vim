" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'romgrk/barbar.nvim'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()