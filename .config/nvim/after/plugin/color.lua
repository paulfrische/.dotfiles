local transparent = true

require('kanagawa').setup({
    transparent = transparent,
})

require('tokyonight').setup({
    transparent = transparent,
    style = 'night',
})

function Color(c)
    c = c or 'tokyonight'
    if c == 'vscode' then

        require('vscode').setup({
            transparent = transparent
        })
        return
    end

    vim.cmd.colorscheme(c)


    if transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

Color()
