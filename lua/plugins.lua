local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
     "SmiteshP/nvim-navic", -- Code Location
     'nvim-treesitter/nvim-treesitter-textobjects', -- Text Objects
     'nishigori/increment-activator', -- good enhance
     'voldikss/vim-floaterm', -- Floating Terminal
     'ThePrimeagen/harpoon', -- Project File util
     'wellle/targets.vim', -- Extra text objects
     'nanotee/zoxide.vim', -- Zoxide
     'jremmen/vim-ripgrep', -- Ripgrep
     'sbdchd/neoformat', -- Format
     'lewis6991/impatient.nvim', -- Start Quickly
     "nathom/filetype.nvim", -- Filetype Faster
     'hrsh7th/cmp-nvim-lsp', -- cmp lsp source
     'dcampos/nvim-snippy', -- snippet manager
     'dcampos/cmp-snippy', -- snippet for cmp
     'onsails/lspkind-nvim', -- icons for menu
     'honza/vim-snippets', -- Snippets
     'hrsh7th/cmp-path', -- Cmp path source
     "nvim-telescope/telescope-file-browser.nvim", -- File Browser
     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- Telescope FZF marriage
     { 'skywind3000/asyncrun.vim', lazy = true },

     {
       'nvim-treesitter/nvim-treesitter',
       build = ':TSUpdate',
       config = function()
        require "confs.treesitter"
       end,
     },
     {
     'hrsh7th/nvim-cmp',
      config = function()
        require "confs.cmp"
      end
     },
     {
    'folke/tokyonight.nvim',
     config = function()
       vim.cmd([[colorscheme tokyonight]])
       import = "confs.colorscheme"
     end
     },
     {
       'nvim-telescope/telescope.nvim',
        dependencies = {
        'nvim-lua/plenary.nvim',
        },
        config = function()
          require "confs.telescope"
        end
     },
     {
     'kyazdani42/nvim-tree.lua',
      config = function()
        require "confs.nvim-tree"
      end
     }
  }


local opts = {}

require("lazy").setup(plugins, opts)

