local gh = require('utils').gh

vim.pack.add { gh 'folke/snacks.nvim' }

require('snacks').setup {
  picker = {
    enabled = true,
    matcher = { frecency = true },
    sources = {
      files = {
        hidden = true,
        exclude = { '.git' },
      },
      grep = {
        hidden = true,
        exclude = { '.git' },
      },
      buffers = {
        win = {
          input = {
            keys = {
              ['<c-d>'] = { 'bufdelete', mode = { 'n', 'i' }, desc = 'Delete Buffer' },
            },
          },
          list = {
            keys = {
              ['<c-d>'] = { 'bufdelete', mode = { 'n', 'i' }, desc = 'Delete Buffer' },
            },
          },
        },
      },
    },
  },
}

vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', function() Snacks.picker.smart() end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', function() Snacks.picker.buffers() end, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>ss', function() Snacks.picker.pickers() end, { desc = '[S]earch [S]elect Picker' })
vim.keymap.set({ 'n', 'v' }, '<leader>sw', function() Snacks.picker.grep_word() end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>se', function() Snacks.picker.diagnostics { severity = vim.diagnostic.severity.ERROR } end, { desc = '[S]earch [E]rrors' })
vim.keymap.set('n', '<leader>sr', function() Snacks.picker.resume() end, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', function() Snacks.picker.recent() end, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sc', function() Snacks.picker.commands() end, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader><leader>', function() Snacks.picker.buffers() end, { desc = '[ ] Find existing buffers' })

-- Add Snacks-based LSP pickers when an LSP attaches to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('snacks-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf

    -- Find references for the word under your cursor.
    vim.keymap.set('n', 'grr', function() Snacks.picker.lsp_references() end, { buffer = buf, desc = '[G]oto [R]eferences' })

    -- Jump to the implementation of the word under your cursor.
    vim.keymap.set('n', 'gri', function() Snacks.picker.lsp_implementations() end, { buffer = buf, desc = '[G]oto [I]mplementation' })

    -- Jump to the definition of the word under your cursor.
    vim.keymap.set('n', 'grd', function() Snacks.picker.lsp_definitions() end, { buffer = buf, desc = '[G]oto [D]efinition' })

    -- Fuzzy find all the symbols in your current document.
    vim.keymap.set('n', 'gO', function() Snacks.picker.lsp_symbols() end, { buffer = buf, desc = 'Open Document Symbols' })

    -- Fuzzy find all the symbols in your current workspace.
    vim.keymap.set('n', 'gW', function() Snacks.picker.lsp_workspace_symbols() end, { buffer = buf, desc = 'Open Workspace Symbols' })

    -- Jump to the type of the word under your cursor.
    vim.keymap.set('n', 'grt', function() Snacks.picker.lsp_type_definitions() end, { buffer = buf, desc = '[G]oto [T]ype Definition' })
  end,
})

-- Override default behavior and theme when searching
vim.keymap.set(
  'n',
  '<leader>/',
  function()
    Snacks.picker.lines {
      layout = { preset = 'dropdown' },
    }
  end,
  { desc = '[/] Fuzzily search in current buffer' }
)

-- Live Grep in Open Files
vim.keymap.set(
  'n',
  '<leader>s/',
  function()
    Snacks.picker.grep_buffers {
      title = 'Live Grep in Open Files',
    }
  end,
  { desc = '[S]earch [/] in Open Files' }
)

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [N]eovim files' })
