call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"UTIL:
""""""
    "Telescope
    "Plug 'nvim-lua/plenary.nvim'
    "Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "ale - add prettier to this also
    "nerdcommenter/vim-commentary
    "indent blank line
    "brackets auto fill
    "surround.vim
    "multiple cursor
    "emmet

    "Completion:
        "Plug 'neoclide/coc.nvim', {'branch': 'release'}
        "or use coq.nvim
    
        "nvim/lsp-config and configure it
            "Plug 'neovim/nvim-lspconfig'
        "lspsaga
            "Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
        "nvim-cmp:
            "Plug 'hrsh7th/cmp-nvim-lsp'
            "Plug 'hrsh7th/cmp-buffer'
            "Plug 'hrsh7th/cmp-path'
            "Plug 'hrsh7th/cmp-cmdline'
            "Plug 'hrsh7th/nvim-cmp

            "For luasnip users.
                "Plug 'L3MON4D3/LuaSnip'
                "Plug 'saadparwaiz1/cmp_luasnip'

"LANGUAGE PACKS:
Plug 'sheerun/vim-polyglot'


"FILE MANAGER:
Plug 'preservim/nerdtree'

    "Chadtree:
    "Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m pip install chadtree && python -m pip chadtree deps'}

    "Nvimtree:
    "Plug 'nvim-tree/nvim-tree.lua'
    
"THEMES:
"""""""
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sainnhe/gruvbox-material'



"UI:
Plug 'nvim-lualine/lualine.nvim'
"Plug 'romgrk/barbar.nvim'
"Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
"treesitter
"rainbow brackets

call plug#end()
