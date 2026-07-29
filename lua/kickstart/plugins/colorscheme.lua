local gh = require('utils').gh

local themes = {
  gh 'folke/tokyonight.nvim',
  gh 'rebelot/kanagawa.nvim',
}
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add(themes)

vim.cmd.colorscheme 'tokyonight-night'
