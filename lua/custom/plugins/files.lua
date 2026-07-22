vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup({
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      return name == ".git" or name == ".DS_Store" or name == ".."
    end,
  },
  keymaps = {
    ["<leader>to"] = {
      desc = "Open terminal in current dir (vsplit)",
      callback = function()
        local dir = require("oil").get_current_dir()
        if dir then
          vim.cmd("vsplit")
          vim.cmd("lcd " .. vim.fn.fnameescape(dir))
          vim.cmd("term")
          vim.cmd("startinsert")
        end
      end,
    },
  }
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.pack.add { 'https://github.com/mikavilpas/yazi.nvim.git' }
require('yazi').setup({
  open_for_directories = false,
  floating_window_scaling_factor = 0.8
})
vim.keymap.set("n", "\\", "<CMD>Yazi<CR>", { desc = "Open yazi at current file" })
