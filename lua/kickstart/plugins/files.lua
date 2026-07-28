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
