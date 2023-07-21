return {
  -- LSP Support
  'neovim/nvim-lspconfig',

  event = 'VeryLazy',
  config = require('paulfrische.plugins.lsp.config').setup,

  dependencies = {

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-emoji' },

    -- styling
    { 'onsails/lspkind.nvim' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- neovim dev
    { 'folke/neodev.nvim' },
  },
}
