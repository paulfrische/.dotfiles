pcall(require, 'pythonpizza.set')
pcall(require, 'pythonpizza.remap')
pcall(require, 'pythonpizza.disable-builtin')

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    bootstrap =
        vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup({
    function(use)
        use('PythonPizzaDE/compit')
        use('nvim-lua/plenary.nvim')
        use('nvim-treesitter/nvim-treesitter')
        use('lewis6991/gitsigns.nvim')
        use('tpope/vim-commentary')
        use('tpope/vim-surround')
        use('ryanoasis/vim-devicons')
        use('norcalli/nvim-colorizer.lua')
        use('Raimondi/delimitMate')
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } })
        use({ 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('kdheepak/lazygit.nvim')
        use('f-person/git-blame.nvim')
        use('lukas-reineke/indent-blankline.nvim')
        use('lvimuser/lsp-inlayhints.nvim')
        use('nvim-telescope/telescope.nvim')
        use('nvim-telescope/telescope-file-browser.nvim')
        use('olacin/telescope-cc.nvim')
        use({
            'nvim-neotest/neotest',
            requires = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter', 'antoinemadec/FixCursorHold.nvim', 'nvim-neotest/neotest-python' },
        })
        use('ahmedkhalf/project.nvim')
        use('stevearc/dressing.nvim')
        use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable('make') == 1 })
        use('rebelot/kanagawa.nvim')
        use('folke/tokyonight.nvim')
        use('Mofiqul/vscode.nvim')
        use('mfussenegger/nvim-dap')
        use('wbthomason/packer.nvim')

        -- lsp
        use({
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },

                -- styling
                { 'onsails/lspkind.nvim' },
            },
        })
        if bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        },
    },
})
