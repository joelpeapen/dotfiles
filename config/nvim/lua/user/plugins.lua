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

    "lmburns/lf.nvim",

    "kylechui/nvim-surround",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    { "numToStr/Comment.nvim", config = true },

    "Wansmer/treesj",
    { "mbbill/undotree", event = "VeryLazy" },
    { "andymass/vim-matchup", event = "VeryLazy" },

    "folke/zen-mode.nvim",
    "karb94/neoscroll.nvim",
    "akinsho/toggleterm.nvim",

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        commit = "e76cb03"
    },
    { "chentoast/marks.nvim", config = true },

    "neogitorg/neogit",
    { "lewis6991/gitsigns.nvim", config = true },
    { "sindrets/diffview.nvim", event = "VeryLazy" },

    { -- telescope
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    { -- debugging
        "mfussenegger/nvim-dap",
        dependencies = {
            { "rcarriga/nvim-dap-ui", pin = true },
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go"
        }
    },

    "folke/trouble.nvim",
    "j-hui/fidget.nvim",

    ----------------- LSP -----------------

    "neovim/nvim-lspconfig",

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
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
    "lewis6991/satellite.nvim",
    "brenoprata10/nvim-highlight-colors",
    "lukas-reineke/indent-blankline.nvim",

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
