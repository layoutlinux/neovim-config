return {

  {

    'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
          },
        },
      },

    { 'Bilal2453/luvit-meta', lazy = true },

  {
      'neovim/nvim-lspconfig',
        dependencies = {

          { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
          { 'j-hui/fidget.nvim', opts = {} },

          -- Allows extra capabilities provided by nvim-cmp
          --'hrsh7th/cmp-nvim-lsp',
        },

        config = function()

        native_lsp = {
            enabled = true,
            
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
            },
            
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
                ok = { "underline" },
            },
            
            inlay_hints = {
                background = true,
            },
        }

        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup({})

        lspconfig.pylyzer.setup({})

        lspconfig.bashls.setup({})

        lspconfig.marksman.setup({})

        require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = { 'lua_ls', 'bashls', 'pylyzer', 'marksman' }
            })

        require('mason-tool-installer').setup({})

        end
    }


}



