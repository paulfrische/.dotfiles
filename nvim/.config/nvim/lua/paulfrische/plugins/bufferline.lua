---@diagnostic disable: missing-fields
return {
  'akinsho/bufferline.nvim',
  config = function ()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        separator_style = 'slant'
      }
    })
  end
}
