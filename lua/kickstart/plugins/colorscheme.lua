local gh = require('utils').gh

local themes = {
  gh 'folke/tokyonight.nvim',
  gh 'rebelot/kanagawa.nvim',
  gh 'sainnhe/everforest',
  gh 'sainnhe/sonokai',
  gh 'sainnhe/gruvbox-material',
}

vim.pack.add(themes)

vim.g.everforest_background = 'hard'
vim.g.everforest_enable_italic = true
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_enable_italic = true

vim.cmd.colorscheme 'gruvbox-material'
