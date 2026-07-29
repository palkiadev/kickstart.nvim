local gh = require('utils').gh

-- [[ Fuzzy Finder (files, lsp, etc) ]]
--
-- Fzf-lua is a fuzzy finder that comes with a lot of different things that
-- it can fuzzy find! It's more than just a "file finder", it can search
-- many different aspects of Neovim, your workspace, LSP, and more!
--
-- The easiest way to use fzf-lua, is to start by doing something like:
--  :FzfLua help_tags
--
-- After running this command, a window will open up and you're able to
-- type in the prompt window. You'll see a list of options and
-- a corresponding preview of the help.
--
-- Fzf-lua maps normal `fzf` keys, typically:
--  - <Tab> to multi-select
--  - <C-g> to toggle preview window
--  - <C-c> or <Esc> to exit

---@type (string|vim.pack.Spec)[]
local fzf_plugins = {
  gh 'ibhagwan/fzf-lua',
  gh 'nvim-tree/nvim-web-devicons', -- optional but recommended for icons
}

-- NOTE: You can install multiple plugins at once
vim.pack.add(fzf_plugins)

local fzf = require 'fzf-lua'

-- See `:help fzf-lua` and `:help fzf-lua.setup()`
fzf.setup {}

-- Register fzf-lua as the default UI selector for Neovim (replaces telescope-ui-select)
fzf.register_ui_select()

-- Keymaps
vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect Fzf-Lua' })
-- Fzf-lua maps grep_cword for Normal mode and grep_visual for Visual mode
vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
vim.keymap.set('v', '<leader>sw', fzf.grep_visual, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>se', function() fzf.diagnostics_workspace { severity = vim.diagnostic.severity.ERROR } end, { desc = '[S]earch [E]rrors' })
vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sc', fzf.commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })

-- Add Fzf-lua based LSP pickers when an LSP attaches to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('fzf-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf

    -- Find references for the word under your cursor.
    vim.keymap.set('n', 'grr', fzf.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })

    -- Jump to the implementation of the word under your cursor.
    vim.keymap.set('n', 'gri', fzf.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })

    -- Jump to the definition of the word under your cursor.
    vim.keymap.set('n', 'grd', fzf.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })

    -- Fuzzy find all the symbols in your current document.
    vim.keymap.set('n', 'gO', fzf.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })

    -- Fuzzy find all the symbols in your current workspace.
    vim.keymap.set('n', 'gW', fzf.lsp_live_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })

    -- Jump to the type of the word under your cursor.
    vim.keymap.set('n', 'grt', fzf.lsp_typedefs, { buffer = buf, desc = '[G]oto [T]ype Definition' })
  end,
})

-- Override default behavior and theme when searching lines in the current buffer
vim.keymap.set('n', '<leader>/', function()
  -- Fzf-lua's `blines` acts similarly to `current_buffer_fuzzy_find`.
  -- Custom winopts here emulate Telescope's dropdown theme.
  fzf.blines {
    winopts = {
      height = 0.33,
      width = 0.66,
      row = 0.33,
      preview = { hidden = 'hidden' },
    },
  }
end, { desc = '[/] Fuzzily search in current buffer' })

-- Live Grep in Open Files
vim.keymap.set('n', '<leader>s/', function()
  fzf.lgrep_buffers {
    prompt = 'Live Grep (Open Files)> ',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function() fzf.files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [N]eovim files' })
