vim.g.clipboard = {
  name = 'macos+tmux',
  copy = {
    ['+'] = { 'pbcopy' },
    ['*'] = { 'tmux', 'load-buffer', '-' },
  },
  paste = {
    ['+'] = { 'pbpaste' },
    ['*'] = { 'tmux', 'save-buffer', '-' },
  },
  cache_enabled = 0,
}

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

local opts = {
  -- Spaces instead of tabs
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  shiftround = true,
  expandtab = true,
  smartindent = true,

  -- Something about buffers
  hidden = true,

  -- Editor layout
  number = true,
  relativenumber = true,
  signcolumn = 'yes',
  colorcolumn = { 80 },

  -- Text rendering
  wrap = false,
  listchars = {
    tab = '\\u00bb ',
    eol = '\\u21b2',
    extends = '|',
    precedes = '|',
    lead = '\\u00b7',
    trail = '\\u00b7',
    nbsp = '\\u2620',
  },
  list = true,

  -- Editor behavior
  mouse = 'n',
  scrolloff = 5,
  scroll = 15,
  -- Make the block cursor in insert mode instead of neovim's default bar
  guicursor = '',
  -- These are quite garish until we have a colorscheme installed
  -- termguicolors = true,
  timeout = false,
  ttimeout = true,
  ttimeoutlen = 100,
  ['path:append'] = '**',

  completeopt = { 'menu', 'menuone', 'noselect', 'preview' },
}

for opt, value in pairs(opts) do
  local optname, method = string.match(opt, "(.-):(.*)")
  if method then
    vim.opt[optname][method](vim.opt[optname], value)
  else
    vim.opt[opt] = value
  end
end
