-- Run rust app
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

