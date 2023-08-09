return {
  plugins = {
    {
      'RRethy/nvim-treesitter-textsubjects',
      event = { 'BufReadPost', 'BufNewFile' },
    }
  },
  ts_opts = {
    textsubjects = {
      enable = true,
      prev_selection = '<BS>',
      keymaps = {
          ['\\'] = 'textsubjects-smart',
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'g\\',
        node_incremental = 'g\\',
        scope_incremental = false,
        node_decremental = 'g<BS>',
      },
    },
  },
  config = function()
    vim.keymap.set('n', '\\', 'V\\', { remap = true })
  end,
}
