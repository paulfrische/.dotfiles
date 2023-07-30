return {
  'is0n/jaq-nvim',
  cmd = 'Jaq',
  enabled = false,
  config = function()
    require('jaq-nvim').setup({
      cmds = {
        internal = {
          lua = 'luafile %',
        },

        external = {
          python = 'python3 $filePath',
          c = 'make run',
          cpp = 'make run',
          rust = 'cargo run -q',
        },
      },
    })
  end,
}
