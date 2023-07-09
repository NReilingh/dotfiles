return {
  {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    build = ':COQdeps',
    cmd = { 'COQnow', 'COQdeps', 'COQhelp' },
    event = 'InsertEnter',
    dependencies = {
      {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
      },
      {
        'ms-jpq/coq.thirdparty',
        branch = '3p',
      },
    },
    config = function()
      vim.cmd [[
" 🐓 Coq completion settings

" Set recommended to false
let g:coq_settings = { "keymap.recommended": v:false }

" Keybindings
ino <silent><expr> <Esc> pumvisible() ? (complete_info().selected == -1 ? "\<C-e><Esc>"  : "\<C-y><Esc>")  : "\<Esc>"
ino <silent><expr> <C-c> pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>  pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>  pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>"  : "\<C-y><CR>")  : "\<CR>"
ino <silent><expr> <Tab> pumvisible() ? (complete_info().selected == -1 ? "\<C-e><Tab>" : "\<C-y><Tab>") : "\<Tab>"

:COQnow --shut-up
      ]]
    end,
  },
}
