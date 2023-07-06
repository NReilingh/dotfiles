textobjects = require('plugins/treesitter.textobjects')
playground = require('plugins/treesitter.playground')
selection = require('plugins/treesitter.selection')

return {
  require('plugins/treesitter.context'),
  textobjects.plugin,
  playground.plugin,
  unpack(selection.plugins),
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = vim.tbl_extend("keep",
      {
        ensure_installed = {
          'bash',
          'css',
          'dockerfile',
          'graphql',
          'html',
          'javascript',
          'json',
          'jsonc',
          'lua',
          'python',
          'query',
          'regex',
          'rust',
          'scss',
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
