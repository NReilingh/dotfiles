return {
  plugin = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  ts_opts = {
    textobjects = {
      select = {
        enable = false,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['as'] = '@statement.outer',
          ['is'] = '@statement.inner',
          ['ad'] = '@conditional.outer',
          ['id'] = '@conditional.inner',
          ['ae'] = '@call.outer',
          ['ie'] = '@call.inner',
          ['am'] = '@comment.outer',
          ['im'] = '@comment.inner',
        },
      },
      move = {
        enable = false,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
          [']b'] = '@block.outer',
          [']l'] = '@loop.outer',
          [']s'] = '@statement.outer',
          [']c'] = '@conditional.outer',
          [']e'] = '@call.outer',
          [']M'] = '@comment.outer',
        },
        goto_next_end = {
          [']M'] = '@comment.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[b'] = '@block.outer',
          ['[l'] = '@loop.outer',
          ['[s'] = '@statement.outer',
          ['[c'] = '@conditional.outer',
          ['[e'] = '@call.outer',
          ['[M'] = '@comment.outer',
        },
        goto_previous_end = {
          ['[M'] = '@comment.outer',
        },
      },
      lsp_interop = {
        enable = false,
        peek_definition_code = {
          ['df'] = '@function.outer',
          ['dF'] = '@class.outer',
        },
      },
    },
  },
}
