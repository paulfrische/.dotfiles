require('lualine').setup({
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        always_divide_middle = false,
        globalstatus = true,
        refresh = {
            statusline = 50,
            tabline = 50,
            winbar = 50,
        },
    },
    sections = {
        lualine_a = { { 'mode', icons_enabled = true, icon = '漣' } },
        lualine_b = {},
        lualine_c = {
            { 'diagnostics', sources = { 'nvim_lsp' } },
            function()
                return '%='
            end,
            { 'filename', icons_enabled = true, icon = '' },
        },
        lualine_x = {
            'filetype',
            function()
                return '%='
            end,
        },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
})
