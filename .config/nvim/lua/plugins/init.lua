return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        colors = {
          theme = {
            wave = {
              ui = {
                bg_visual = require("kanagawa.colors").setup({ theme = 'wave' }).palette.sumiInk5
              }
            }
          }
        }
      })
      require('kanagawa').load('wave')
    end,
  },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function(opts)
      require('oil').setup(opts)
      vim.keymap.set('n', '<Leader>-', require("oil").open, { desc = "Open parent directory" })
    end,
  },
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    config = function()
      vim.cmd [[ Copilot enable ]]
    end,
  },
}
