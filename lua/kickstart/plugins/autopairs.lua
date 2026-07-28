vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
require('nvim-autopairs').setup {
  ignored_next_char = '[%w%.%(%[%{"\']',
}
