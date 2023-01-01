local builtin = require('telescope.builtin')
local telescope = require('telescope')

vim.keymap.set('n', '<leader>s', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

telescope.setup({
    extensions = {
        fzf = {
            override_generic_sorter = true,
        },
    },
})

telescope.load_extension('file_browser')
telescope.load_extension('fzf')
telescope.load_extension('projects')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', telescope.extensions.projects.projects, {})
