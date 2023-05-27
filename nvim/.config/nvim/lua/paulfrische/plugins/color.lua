local transparent = false

local function color_config()
  vim.opt.termguicolors = true

  require('tokyonight').setup({
    transparent = transparent,
    style = 'night',
    styles = {
      floats = transparent and 'transparent',
    },
  })

  vim.cmd.colorscheme('tokyonight')
end

local themes = {
  { 'folke/tokyonight.nvim' },
}

for idx, theme in ipairs(themes) do
  ---@diagnostic disable-next-line: assign-type-mismatch
  themes[idx] = vim.tbl_deep_extend('keep', theme, { lazy = false, priority = 1000, config = color_config })
end

return themes
