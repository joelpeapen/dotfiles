local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ----------------- UTIL-----------------
    -- dash
    "mhinz/vim-startify",

    "is0n/fm-nvim",

    "kylechui/nvim-surround",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    { "numToStr/Comment.nvim", config = true },

    "Wansmer/treesj",
    { "mbbill/undotree", event = "VeryLazy" },
    { "romainl/vim-cool", event = "VeryLazy" }, -- noh
    { "andymass/vim-matchup", event = "VeryLazy" },
    { "nvim-pack/nvim-spectre", event = "VeryLazy" }, -- search & replace

    "folke/zen-mode.nvim",
    "karb94/neoscroll.nvim",
    "akinsho/toggleterm.nvim",

    "ThePrimeagen/harpoon",
    { "chentoast/marks.nvim", config = true },

    { "tpope/vim-fugitive", event = "VeryLazy" },
    { "lewis6991/gitsigns.nvim", config = true },
    { "sindrets/diffview.nvim", event = "VeryLazy" },

    { -- telescope
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    { -- debugging
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text"
        }
    },

    "folke/trouble.nvim",

    ----------------- LSP -----------------

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        }
    },

    { -- treesitter
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/nvim-treesitter-refactor",
            "nvim-treesitter/nvim-treesitter-textobjects"
        }
    },

    ----------------- UI -----------------

    "rebelot/kanagawa.nvim",

    "seblj/nvim-tabline",
    "petertriho/nvim-scrollbar",
    "norcalli/nvim-colorizer.lua",
    "lukas-reineke/indent-blankline.nvim",

    'edluffy/hologram.nvim',

    { -- status line
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" }
    }

},
{
    ui = {
        border = "rounded",
        title = " Plugins "
    },
    install = { missing = false },
    diff = { cmd = "diffview.nvim" }
})
