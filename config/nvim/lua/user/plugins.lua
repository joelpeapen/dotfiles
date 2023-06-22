local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader=" "

-- TODO: treesj, cinnamon.nvim

require("lazy").setup({
    ------------------------------------------ UTIL
    -- startup
    "mhinz/vim-startify",

    -- nvimtree
    { "nvim-tree/nvim-tree.lua", lazy = true },

    -- comment
    "numToStr/Comment.nvim",

    "tpope/vim-fugitive",-- git
    "lewis6991/gitsigns.nvim",
    { "sindrets/diffview.nvim", lazy = true },

    "tpope/vim-surround", -- pairs
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",

    "romainl/vim-cool", -- :noh
    "mbbill/undotree",
    "karb94/neoscroll.nvim", -- scroll
    "akinsho/toggleterm.nvim",

    "folke/zen-mode.nvim",
    -- TODO: "folke/todo-comments.nvim",

    "ThePrimeagen/harpoon",
    -- TODO: "ThePrimeagen/refactoring.nvim",

    { -- Telescope
    	"nvim-telescope/telescope.nvim", version = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },

    { -- debugging
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        lazy = true,
    },

    "folke/trouble.nvim",

    -- {"subnut/nvim-ghost.nvim", module = false},
    --[[ {
        'glacambre/firenvim', build = function()
            vim.fn['firenvim#install'](0)
        end
    }, ]]

    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

    -- render images
    { "edluffy/hologram.nvim" },

    --------------------------------------- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",             -- Required
            "williamboman/mason.nvim",           -- Optional
            "williamboman/mason-lspconfig.nvim", -- Optional

            -- Autocompletion
            "hrsh7th/nvim-cmp",         -- Required
            "hrsh7th/cmp-path",         -- Optional
            "hrsh7th/cmp-buffer",       -- Optional
            "hrsh7th/cmp-cmdline",      -- Optional
            "hrsh7th/cmp-nvim-lsp",     -- Required
            "hrsh7th/cmp-nvim-lua",     -- Optional

            { -- Snippets
                "L3MON4D3/LuaSnip", -- Required
                dependencies = {
                    "saadparwaiz1/cmp_luasnip", -- Optional
                    "rafamadriz/friendly-snippets", -- Optional
                }
            }
        }
    },

    { -- Treesitter
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
        }
    },

    -- "rhysd/vim-grammarous"

    -------------------------------------------- UI

    "sainnhe/gruvbox-material",

    { "folke/tokyonight.nvim", branch = "main", lazy = true },

    { "rose-pine/neovim", name = "rose-pine" },

    -- color highlighter
    "norcalli/nvim-colorizer.lua",

    "petertriho/nvim-scrollbar",
    "lukas-reineke/indent-blankline.nvim",

    { -- status line
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        }
    },

    --[[ {
        "noib3/nvim-cokeline",
        config = function()
            require("cokeline").setup()
        end
    },

    {"akinsho/bufferline.nvim"}, ]]
})
