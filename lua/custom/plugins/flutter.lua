-- [[ Flutter / Dart Setup ]]
-- Highly recommended plugin for Flutter development.
-- It handles starting `dartls` and gives you tools for hot-reload, emulator selection, etc.
vim.pack.add { 'https://github.com/nvim-flutter/flutter-tools.nvim.git' }

require('flutter-tools').setup {}

vim.keymap.set('n', '<leader>fr', '<cmd>FlutterRun<CR>', { desc = '[F]lutter [R]un' })
vim.keymap.set('n', '<leader>fq', '<cmd>FlutterQuit<CR>', { desc = '[F]lutter [Q]uit' })
vim.keymap.set('n', '<leader>fh', '<cmd>FlutterReload<CR>', { desc = '[F]lutter [H]ot Reload' })
vim.keymap.set('n', '<leader>fR', '<cmd>FlutterRestart<CR>', { desc = '[F]lutter Hot [R]estart' })
vim.keymap.set('n', '<leader>fd', '<cmd>FlutterDevices<CR>', { desc = '[F]lutter Select [D]evice' })
