local current_path = (...):gsub("%.init$", "")

require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"
        use "shaunsingh/nord.nvim"
        use "junegunn/fzf"
        use "junegunn/fzf.vim"
        use "b3nj5m1n/kommentary"
        use "nvim-lua/lsp-status.nvim"
        use "neovim/nvim-lspconfig"
        use "bfredl/nvim-luadev"
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/vim-vsnip",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp"
            }
        }
        use "saadparwaiz1/cmp_luasnip"
        use "L3MON4D3/LuaSnip"
        use "mhartington/formatter.nvim"
        use "nvim-lua/plenary.nvim"
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-fzy-native.nvim"},
                {"nvim-telescope/telescope-dap.nvim"}
            }
        }
        use {
            "hoob3rt/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            branch = "0.5-compat",
            run = ":TSUpdate"
        }
        use "nvim-treesitter/playground"
        use "kyazdani42/nvim-tree.lua"
        use "mhinz/vim-startify"
        use "kdheepak/lazygit.nvim"
        use "windwp/nvim-autopairs"
        use {
            "unisonweb/unison",
            branch = "trunk",
            rtp = "editor-support/vim"
        }
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            }
        }
        use {"kristijanhusak/orgmode.nvim"}
        use {"mfussenegger/nvim-dap"}
        use {"theHamsta/nvim-dap-virtual-text"}
        use {
            "rcarriga/nvim-dap-ui",
            requires = {
                "mfussenegger/nvim-dap"
            }
        }
        use {"Pocco81/DAPInstall.nvim"}
        use {
            "rcarriga/vim-ultest",
            config = require(current_path .. ".config.ultest").post(),
            run = ":UpdateRemotePlugins",
            requires = {"vim-test/vim-test"}
        }
        use {"zah/nim.vim"}
    end
)

-- Plugin config
require(current_path .. ".config.lsp")
require(current_path .. ".config.treesitter")
require(current_path .. ".config.nvim-cmp")
require(current_path .. ".config.telescope")
require(current_path .. ".config.lualine")
require(current_path .. ".config.nvim-tree")
require(current_path .. ".config.autopairs")
require(current_path .. ".config.gitsigns")
require(current_path .. ".config.orgmode")
require(current_path .. ".config.debug")
require(current_path .. ".config.nvim-dap-ui")
require(current_path .. ".config.ultest")
require(current_path .. ".config.dap-install")
