return {
  { "catppuccin/nvim",       name = "catppuccin", priority = 1000, lazy = true },
  {
    "ibhagwan/fzf-lua",
    lazy = true,
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end,
  },
  {
    "b3nj5m1n/kommentary",
    event = { "BufReadPost", "BufNewFile" }, -- Load when buffer is opened
  },
  {
    "nvim-lua/lsp-status.nvim",
    event = { "BufReadPost", "BufNewFile" }, -- Load when buffer is opened
  },
  { "neovim/nvim-lspconfig", lazy = true },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = "Trouble",
    keys = {
      {
        "<leader>tr",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- { "jubnzv/virtual-types.nvim", lazy = true },
  { "bfredl/nvim-luadev",                         lazy = true },
  {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPost", "BufNewFile" }, -- Load when buffer is opened
  },
  {
    "hrsh7th/cmp-buffer",
    event = { "BufReadPost", "BufNewFile" }, -- Load when buffer is opened
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPost", "BufNewFile" }, -- Load when buffer is opened
  },
  { "saadparwaiz1/cmp_luasnip",                   lazy = true },
  { "L3MON4D3/LuaSnip",                           lazy = true },
  { "nvim-telescope/telescope.nvim",              lazy = false },
  { "nvim-telescope/telescope-fzy-native.nvim",   lazy = false },
  -- { "nvim-telescope/telescope-dap.nvim",          lazy = true },
  { "nvim-telescope/telescope-file-browser.nvim", lazy = false },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Load when buffer is opened
  },
  { "goolord/alpha-nvim" },
  { "windwp/nvim-autopairs",     lazy = true },
  { "nmac427/guess-indent.nvim", lazy = true },
  { "lewis6991/gitsigns.nvim",   lazy = true },
  { "nvim-lua/plenary.nvim",     lazy = true },
  { "neovim/nvim-lspconfig" },
  {
    "stevearc/conform.nvim",
    lazy = true,
    opts = {},
  },
  { "mvllow/modes.nvim",     lazy = true },
  { "ellisonleao/glow.nvim", lazy = true },
  {
    "williamboman/mason.nvim",
    lazy = true,
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  {
    "vhyrro/luarocks.nvim",
    lazy = true,
    priority = 1000,
    config = true,
  },
  { "echasnovski/mini.statusline",       version = false, lazy = true },
}
