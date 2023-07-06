return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'nvim-telescope/telescope-frecency.nvim',
      dependencies = {
        'kkharji/sqlite.lua',
      },
    },
  },
  config = function()
    require('telescope').load_extension('fzy_native')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('frecency')
  end,
  keys = {
    { '<Leader>fb', '<Cmd>Telescope buffers<CR>' },
    { '<Leader>fc', '<Cmd>Telescope commands<CR>' },
    { '<Leader>fe', '<Cmd>Telescope find_files<CR>' },
    { '<Leader>ff', '<Cmd>Telescope resume<CR>' },
    { '<Leader>fgc', '<Cmd>Telescope colorscheme<CR>' },
    { '<Leader>fgd', '<Cmd>Telescope lsp_document_diagnostics<CR>' },
    { '<Leader>fge', '<Cmd>Telescope file_browser<CR>' },
    { '<Leader>fgf', '<Cmd>Telescope filetypes<CR>' },
    { '<Leader>fgo', '<Cmd>Telescope oldfiles<CR>' },
    { '<Leader>fh', '<Cmd>Telescope help_tags<CR>' },
    { '<Leader>fk', '<Cmd>Telescope keymaps<CR>' },
    { '<Leader>fl', '<Cmd>Telescope loclist<CR>' },
    { '<Leader>fm', '<Cmd>Telescope marks<CR>' },
    { '<Leader>fo', '<Cmd>Telescope frecency<CR>' },
    { '<Leader>fq', '<Cmd>Telescope quickfix<CR>' },
    { '<Leader>fs', '<Cmd>Telescope lsp_document_symbols<CR>' },
    { '<Leader>ft', '<Cmd>Telescope treesitter<CR>' },
    { '<Leader>fv', '<Cmd>Telescope vim_options<CR>' },
    { '<Leader>fws', '<Cmd>Telescope lsp_workspace_symbols<CR>' },
    { '<Leader>fwd', '<Cmd>Telescope lsp_workspace_diagnostics<CR>' },
    { '<Leader>fw/', '<Cmd>Telescope live_grep<CR>' },
    { '<Leader>f"', '<Cmd>Telescope registers<CR>' },
    { '<Leader>f/', '<Cmd>Telescope current_buffer_fuzzy_find<CR>' },
  }
}
