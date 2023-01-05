require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'rust', 'python', 'html', 'css' },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    playground = {},
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
})
