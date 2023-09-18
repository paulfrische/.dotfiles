vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.cmdheight = 0
vim.opt.relativenumber = true
vim.opt.number = true
-- vim.opt.numberwidth = 6
vim.opt.scrolloff = 8
vim.opt.title = true
vim.opt.list = true
vim.opt.listchars:append('trail:·')
vim.opt.fillchars:append('eob: ')
-- vim.opt.listchars:append('eol:↴')
vim.opt.undofile = true
-- vim.opt.colorcolumn = '80'
vim.opt.cursorline = false
vim.opt.updatetime = 300
vim.opt.swapfile = false
vim.opt.signcolumn = 'yes:2'
vim.opt.hlsearch = true
-- vim.opt.guicursor = 'a:block'

-- alias :Q to :qa!, :W to :w, :Wq to :wq, :WQ to :wq
vim.api.nvim_create_user_command('Q', 'qa!', {})
vim.api.nvim_create_user_command('W', 'w ++p', {})
vim.api.nvim_create_user_command('Wq', 'wq ++p', {})
vim.api.nvim_create_user_command('WQ', 'wq ++p', {})

local fonts = {
  JETBRAINS = 'JetBrains Mono',
  IOSEVKA = 'Iosevka Nerd Font Mono',
  UBUNTU = 'UbuntuMono Nerd Font Mono',
}

local current_font = fonts.JETBRAINS
local current_font_size = 14
-- vim.opt.linespace = 6

-- configure neovide
if vim.g.neovide then
  vim.o.guifont = current_font .. ':h' .. current_font_size

  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.1

  local pad = 10
  -- padding between lines
  vim.g.neovide_padding_top = pad
  vim.g.neovide_padding_bottom = pad
  vim.g.neovide_padding_right = pad
  vim.g.neovide_padding_left = pad
end
