-- Space is a good leader key because it's not useful in normal mode.
-- I can't emphasize this enough: space as leader is life changing.
vim.g.mapleader = ' '

local keymaps = {
  n = {
    { '<Leader>d', '<Cmd>lua vim.diagnostic.open_float()<CR>' },
    -- <Leader>f* - plugins/telescope.lua
    { '<Leader>gi', '<Cmd>TSHighlightCapturesUnderCursor<CR>' },
    { '<Leader>gl', '<Cmd>set list!<CR>',
      { silent = true, desc = "Toggle visible whitespace" } },
    { '<Leader>h', '<Cmd>nohlsearch<CR>',
      { silent = true, desc = "Remove search highlighting" } },
    { '<Leader>i', '<Cmd>lua vim.lsp.buf.hover()<CR>' },
    { '<Leader>lr', '<Cmd>LspRestart<CR>' },
    { '<Leader>s', '<Cmd>write<CR>' },
    { '<Leader>t', '<Cmd>Neotree toggle<CR>' },
    { '<Leader>w', '<Cmd>bprevious<CR><Cmd>bdelete #<CR>' },
  },
  -- Make command mode more like macOS's default shell
  c = {
    { '<C-a>', '<Home>', { desc = "cursor to beginning of command-line" } },
    { '<C-b>', '<Left>', { desc = "cursor left" } },
    { '<C-f>', '<Right>', { desc = "cursor right" } },
  }
}

local augroups = {
  NmrQuickFixMaps = {
    -- Use o in quickfix mode to show the target without switching to it.
    { 'FileType', 'qf', 'nnoremap <buffer> o <CR><C-w>p' }
  },
}

for group, autocmds in pairs(augroups) do
  local augroup = vim.api.nvim_create_augroup(group, { clear = true })

  for _, autocmd in ipairs(autocmds) do
    vim.api.nvim_create_autocmd(autocmd[1], {
      pattern = autocmd[2],
      command = autocmd[3],
      group = augroup,
    })
  end

end

for mode, maps in pairs(keymaps) do
  for _, map in ipairs(maps) do
    vim.keymap.set(mode, unpack(map))
  end
end
