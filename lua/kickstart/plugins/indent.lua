local gh = require('utils').gh

vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

vim.pack.add { gh 'lukas-reineke/indent-blankline.nvim' }
require('ibl').setup {
  indent = {
    char = '▏',
  },
  scope = {
    enabled = true,
    char = '▏',
    show_start = false,
    show_end = false,
  },
}
