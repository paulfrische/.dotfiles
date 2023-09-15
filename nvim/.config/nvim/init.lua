--  ____             _   _____     _          _
-- |  _ \ __ _ _   _| | |  ___| __(_)___  ___| |__   ___
-- | |_) / _` | | | | | | |_ | '__| / __|/ __| '_ \ / _ \
-- |  __/ (_| | |_| | | |  _|| |  | \__ \ (__| | | |  __/
-- |_|   \__,_|\__,_|_| |_|  |_|  |_|___/\___|_| |_|\___|

-- TERMGUI COLORS 🏆
vim.opt.termguicolors = true

-- because I need random for presence.nvim
math.randomseed(os.time())

require('paulfrische')

local util = require('paulfrische.util')

P = util.print_table
Words = util.words_in_buffer
Selected = util.selected
