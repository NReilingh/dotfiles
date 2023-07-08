return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'main',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    source_selector = {
      winbar = true,
    },
  },
}
