return {

    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',

    config = function()

      require("nvim-treesitter").setup({

          ensure_installed = { 'bash', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'css', 'vim', 'vimdoc', 'ruby', 'ssh_config' },
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' },
      },

          indent = { enable = true, disable = { 'ruby' } },

          incremental_selection = {
              enable = true,
              keymaps = {
                  init_selection = "gnn", -- set to `false` to disable one of the mappings
                  node_incremental = "grn",
                  scope_incremental = "grc",
                  node_decremental = "grm",
              },
          },

      })

    end
}
