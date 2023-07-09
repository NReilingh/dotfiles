local textobjects = require('plugins/treesitter.textobjects')
local playground = require('plugins/treesitter.playground')
local selection = require('plugins/treesitter.selection')

return {
  require('plugins/treesitter.context'),
  textobjects.plugin,
  playground.plugin,
  unpack(selection.plugins),
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSInstallInfo', 'TSModuleInfo', 'TSEnable', 'TSDisable', 'TSToggle' },
    opts = vim.tbl_extend("keep",
      {
        ensure_installed = {
          'bash',
          'clojure',
          'css',
          'cue',
          'dockerfile',
          'elixir',
          'elm',
          'erlang',
          'graphql',
          'html',
          'javascript',
          'json',
          'jsonc',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'norg',
          'perl',
          'php',
          'python',
          'query',
          'regex',
          'rust',
          'scss',
          'sql',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
        },
      },
      textobjects.ts_opts,
      playground.ts_opts,
      selection.ts_opts
    ),
    config = function (_, opts)
      require('nvim-treesitter.configs').setup(opts)
      selection.config()
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = true,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
        },
      }
    },
  },
}
