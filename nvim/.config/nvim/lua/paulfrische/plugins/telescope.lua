return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  keys = {
    '<leader>f',
    '<leader>ds',
    '<leader>ws',
    '<leader>p',
    '<leader>gb',
    '<leader>s',
    '<leader>b',
  },
  cmd = { 'Telescope', 'TH' },
  config = function()
    local builtin = require('telescope.builtin')
    local telescope = require('telescope')

    telescope.setup({
      extensions = {
        fzf = {
          override_generic_sorter = true,
        },
      },
      defaults = {
        borderchars = {
          { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
          preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
        prompt_prefix = ' 🔎 ',

        file_ignore_patterns = {
          '__pycache__/',
          'node_modules/',
          '.git/',
        },

        layout_strategy = 'center',
        layout_config = {
          anchor = 'N',
        },
      },
    })

    local ok, err = pcall(telescope.load_extension, 'fzf')
    if not ok then
      print(err)
    end

    local map = require('paulfrische.util').map

    map('n', '<leader>f', builtin.find_files)
    map('n', '<leader>b', builtin.buffers)
    map('n', '<leader>ds', builtin.lsp_document_symbols)
    map('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols)
    map('n', '<leader>gb', builtin.git_branches)
    map('n', '<leader>s', function()
      builtin.grep_string({ search = vim.fn.input('Grep > ') })
    end)

    vim.api.nvim_create_user_command('TH', 'Telescope help_tags', {})
  end,
}
