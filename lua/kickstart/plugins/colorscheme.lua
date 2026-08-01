local gh = require('utils').gh

local themes = {
  gh 'folke/tokyonight.nvim',
  gh 'rebelot/kanagawa.nvim',
  gh 'sainnhe/everforest',
  gh 'sainnhe/sonokai',
  gh 'sainnhe/gruvbox-material',
  gh 'palkiaex/solarized.nvim',
  { src = gh 'catppuccin/nvim', name = 'catppuccin' },
}

vim.pack.add(themes)

vim.g.everforest_background = 'hard'
vim.g.everforest_enable_italic = false
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_enable_italic = false

vim.cmd.colorscheme 'solarized'
