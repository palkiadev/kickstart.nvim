vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.pack.add { 'https://github.com/mikavilpas/yazi.nvim.git' }
require('yazi').setup({
  open_for_directories = false,
  floating_window_scaling_factor = 0.8
})
vim.keymap.set("n", "\\", "<CMD>Yazi<CR>", { desc = "Open yazi at current file" })
