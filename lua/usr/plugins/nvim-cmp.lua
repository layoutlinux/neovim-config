return {
    'hrsh7th/nvim-cmp',
    version = false,
    event = "InsertEnter",

    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
    },

    opts = function()

    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    local cmp = require("cmp")
    local auto_select = true


    return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
            completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },

        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,


        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                                            ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                            ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                                            ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                                            ["<C-Space>"] = cmp.mapping.complete(),
                                            --[[ ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
                                            ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
                                            ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace ]]-- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                                            ["<C-CR>"] = function(fallback)
                                            cmp.abort()
                                            fallback()
                                            end, 
        }),

        sources = cmp.config.sources({
            per_filetype = {
                codecompanion = { "codecompanion" },
            },
            { name = "copilot", group_index = 2 },
            { name = "lazydev",  group_index = 2 },
            { name = "nvim_lsp", group_index = 2 },
            { name = "path", group_index = 2 },
            { name = "luasnip", group_index = 2 },
        }, {
            { name = "buffer" },
        }),


        sorting = {
            priority_weight = 2,
            comparators = {
                require("copilot_cmp.comparators").prioritize,

                -- Below is the default comparitor list and order for nvim-cmp
                cmp.config.compare.offset,
                -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                cmp.config.compare.locality,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },

        experimental = {
            -- only show ghost text when we show ai completions
            ghost_text = vim.g.ai_cmp and {
                hl_group = "CmpGhostText",
            } or false,
        },
    }
    end
}

