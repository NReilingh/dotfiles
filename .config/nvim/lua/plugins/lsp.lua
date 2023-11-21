return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local nvim_lsp = require('lspconfig')

    nvim_lsp.rust_analyzer.setup{}
    nvim_lsp.clojure_lsp.setup{}
    -- This is apparently way too power-hungry
    -- nvim_lsp.perlls.setup{}

    nvim_lsp.perlnavigator.setup{
      cmd = {'node', vim.fn.expand('$HOME/Repositories/PerlNavigator/server/out/server.js'), '--stdio'},
      settings = {
        perlnavigator = {
          perlPath = 'perl',
          enableWarnings = true,
          perltidyProfile = '',
          perlcriticProfile = '',
          perlcriticEnabled = true,
        }
      }
    }

    nvim_lsp.tsserver.setup{
      root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json")
    }

    nvim_lsp.denols.setup{
      root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc")
    }

    vim.g.markdown_fenced_languages = {
      "ts=typescript"
    }

    nvim_lsp.intelephense.setup{}
    nvim_lsp.lua_ls.setup{
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    }

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('NmrLspAttach', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>f', function()
        --   vim.lsp.buf.format { async = true }
        -- end, opts)
      end,
    })

  end,
}
