return {
  'windwp/nvim-autopairs',
  config = function()
    local nvim_pairs = require('nvim-autopairs')

    nvim_pairs.setup({
      check_ts = false,
    })

    -- nvim_pairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
  end,
}
