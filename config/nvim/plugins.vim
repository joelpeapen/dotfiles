call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"------------------------------------------"UTIL:

" session restore
Plug 'tpope/vim-obsession'

" startup
Plug 'mhinz/vim-startify'
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
let g:startify_fortune_use_unicode = 0

" read ~/.NERDTreeBookmars file and takes its second column
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Recent']            },
        "\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \]

" file manager:
Plug 'preservim/nerdtree'

" chadtree
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m pip install chadtree && python -m pip chadtree deps'}

" nvimtree - USE WHEN NVIM VERSION >= 0.7.0
"Plug 'nvim-tree/nvim-tree.lua'

" fzf finder
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
"OR: 
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    
" ale - add prettier to this also

" nerdcommenter/vim-commentary
Plug 'tpope/vim-commentary'
autocmd FileType apache setlocal commentstring=#\ %s
  
" multiple cursor
   
" emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" git
Plug 'tpope/vim-fugitive'
    
" vim-cool smart search highlighting
Plug 'romainl/vim-cool'
    
" parens:
Plug 'tpope/vim-surround'

Plug 'LunarWatcher/auto-pairs'
let g:AutoPairs = {'"': '"', '{': '}', '''': '''', '(': ')', '''''''': '''''''', '[': ']', '"""': '"""'}
let g:AutoPairsCompatibleMaps = 0
let g:AutoPairsMapBS = 1
let g:AutoPairsShortcutToggle = ""
let g:AutoPairsShortcutFastWrap = ""
let g:AutoPairsShortcutJump = ""
let g:AutoPairsShortcutBackInsert = ""
let g:AutoPairsMoveExpression = ""
let g:AutoPairsShortcutIgnore = ""
let g:AutoPairsShortcutToggleMultilineClose = ""

" Snippets:
"Plug 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<C-I>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"Plug 'honza/vim-snippets'

"DEBUGGER:
"Plug 'mfussenegger/nvim-dap'
"Plug 'rcarriga/nvim-dap-ui'

"notification
Plug 'rcarriga/nvim-notify'

"-----------------------------------------"LSP:

" Coc completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"or use coq.nvim
    
" nvim/lsp-config and configure it
"Plug 'neovim/nvim-lspconfig'

" lspsaga
"Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" nvim-cmp autocompletion:
"Plug 'hrsh7th/nvim-cmp
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"Plug 'quangnguyen30192/cmp-nvim-ultisnips' " Ultisnips source

  "For luasnip users.
    "Plug 'L3MON4D3/LuaSnip'
    "Plug 'saadparwaiz1/cmp_luasnip'

" treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter-refactor'

"-----------------------------------------"Language:
Plug 'sheerun/vim-polyglot'

" Python
"Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

"------------------------------------------"UI:

" icons
Plug 'kyazdani42/nvim-web-devicons'

" themes
Plug 'sainnhe/gruvbox-material'
"Plug 'ellisonleao/gruvbox.nvim'

" kanagawa
"Plug 'rebelot/kanagawa.nvim'

" status line
Plug 'nvim-lualine/lualine.nvim'

" tab stuff
"Plug 'romgrk/barbar.nvim'
"Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

call plug#end()
