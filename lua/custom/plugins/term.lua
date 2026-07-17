vim.keymap.set('n', '<leader>th', function()
    vim.cmd('15split | term')
    vim.cmd('startinsert')
end, { desc = 'Open horizontal terminal' })

vim.keymap.set('n', '<leader>tv', function()
    vim.cmd('80vsplit | term')
    vim.cmd('startinsert')
end, { desc = 'Open vertical terminal' })
