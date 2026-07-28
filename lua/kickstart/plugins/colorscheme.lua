local gh = require('utils').gh

-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add { gh 'rebelot/kanagawa.nvim' }

vim.cmd.colorscheme 'kanagawa-wave'

