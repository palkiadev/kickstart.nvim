local function gh(repo) return 'https://github.com/' .. repo end

-- do
--   vim.pack.add {
--     gh 'mfussenegger/nvim-dap',
--     gh 'rcarriga/nvim-dap-ui',
--     gh 'nvim-neotest/nvim-nio',
--     gh 'mrcjkb/rustaceanvim',
--   }
--
--   local dap = require('dap')
--   local dapui = require('dapui')
--   dapui.setup()
--
--   dap.listeners.after.event_initialized['dapui_config'] = dapui.open
--   dap.listeners.before.event_terminated['dapui_config'] = dapui.close
--   dap.listeners.before.event_exited['dapui_config'] = dapui.close
--
--   vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
--   vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
--   vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
--   vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
--   vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle [B]reakpoint' })
--   vim.keymap.set('n', '<leader>B', function()
--     dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
--   end, { desc = 'Debug: Set Conditional [B]reakpoint' })
-- end

vim.keymap.set('n', '<leader>cr', function()
  vim.cmd('silent! update')
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  vim.cmd('vsplit | term cargo run')
  vim.cmd('vertical resize 80')
  vim.cmd('startinsert')
end, { desc = '[C]argo [R]un' })

