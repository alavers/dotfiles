local status, packer = pcall(require, 'packer')

if (not status) then
  print('Packer is not installed');
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'        -- Common utilities

  use 'mileszs/ack.vim'              -- File search
  use 'ellisonleao/gruvbox.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'nvim-lualine/lualine.nvim'    -- Statusline
  use 'onsails/lspkind-nvim'         -- vscode-like pictograms
  use 'nvim-tree/nvim-tree.lua'      -- file explorer
  use 'nvim-tree/nvim-web-devicons' -- File icons

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  use 'hrsh7th/nvim-cmp'             -- Completion
  use 'hrsh7th/cmp-buffer'           -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'         -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'     -- Snippet completion

  use 'sindrets/diffview.nvim'

  use 'gpanders/editorconfig.nvim'
  use 'neovim/nvim-lspconfig'        -- LSP
  use {
    'nvimdev/lspsaga.nvim',
    requires = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'}
  }

  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
  use { 'mxsdev/nvim-dap-vscode-js', requires = { 'mfussenegger/nvim-dap' } }

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'ThePrimeagen/harpoon'

  use 'akinsho/bufferline.nvim'
  use 'kazhala/close-buffers.nvim'
  use 'norcalli/nvim-colorizer.lua'

  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  use 'numToStr/Comment.nvim' -- Toggle comments

  use 'google/vim-jsonnet'
end)
