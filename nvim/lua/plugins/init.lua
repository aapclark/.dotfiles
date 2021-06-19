local current_path = (...):gsub('%.init$', '')

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'shaunsingh/nord.nvim'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'b3nj5m1n/kommentary'
    use 'nvim-lua/lsp-status.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'bfredl/nvim-luadev'
    use 'hrsh7th/nvim-compe'
    use 'mhartington/formatter.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzy-native.nvim' },
        }
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'nvim-treesitter/nvim-treesitter'
    }
    use 'nvim-treesitter/playground'
    use 'kyazdani42/nvim-tree.lua'
    use 'mhinz/vim-startify'
    use 'kdheepak/lazygit.nvim'
    use 'steelsojka/pears.nvim'
    use {
      'unisonweb/unison',
      branch = 'trunk',
      rtp = 'editor-support/vim'

    }
end)

-- Plugin config
require(current_path .. '.config.lsp')
require(current_path .. '.config.treesitter')
require(current_path .. '.config.telescope')
require(current_path .. '.config.lualine')
require(current_path .. '.config.nvim-tree')
require(current_path .. '.config.pears')
