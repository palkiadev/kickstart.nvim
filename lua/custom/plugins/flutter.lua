-- [[ Flutter / Dart Setup ]]
vim.pack.add { 'https://github.com/nvim-flutter/flutter-tools.nvim.git' }

require('flutter-tools').setup {}

vim.api.nvim_create_user_command('Fr', 'FlutterRun', {})
vim.api.nvim_create_user_command('Frm', 'FlutterRun -d macos', {})
vim.api.nvim_create_user_command('Frw', 'FlutterRun -d windows', {})
vim.api.nvim_create_user_command('Fri', 'FlutterRun -d ios', {})
vim.api.nvim_create_user_command('Fq', 'FlutterQuit', {})
vim.api.nvim_create_user_command('Fh', 'FlutterReload', {})
vim.api.nvim_create_user_command('FR', 'FlutterRestart', {})
vim.api.nvim_create_user_command('Fd', 'FlutterDevices', {})

