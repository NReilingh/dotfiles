-- Space is a good leader key because it's not useful in normal mode.
-- I can't emphasize this enough: space as leader is life changing.
vim.g.mapleader = ' '

local nkeymaps = {
  { '\\', 'V\\' },
  { '<Leader>d', '<Cmd>lua vim.diagnostic.open_float()<CR>' },
  -- <Leader>f* - plugins/telescope.lua
  -- Set a shortcut to toggle visible whitespace on and off.
  { '<Leader>gi', '<Cmd>TSHighlightCapturesUnderCursor<CR>' },
  { '<Leader>gl', '<Cmd>set list!<CR>', { silent = true } },
  -- Remove search highlighting.
  { '<Leader>h', '<Cmd>nohlsearch<CR>', { silent = true } },
  { '<Leader>i', '<Cmd>lua vim.lsp.buf.hover()<CR>' },
  { '<Leader>lr', '<Cmd>LspRestart<CR>' },
  { '<Leader>s', '<Cmd>write<CR>' },
  { '<Leader>t', '<Cmd>Neotree toggle<CR>' },
  { '<Leader>w', '<Cmd>bprevious<CR><Cmd>bdelete #<CR>' },
}

local augroups = {
  NmrQuickFixMaps = {
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

for _, map in ipairs(nkeymaps) do
  vim.keymap.set('n', unpack(map))
end
