return {
  'is0n/jaq-nvim',
  cmd = 'Jaq',
  enabled = false,
  opts = {
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
  },
}
