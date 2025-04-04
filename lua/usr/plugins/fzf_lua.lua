return {

  "ibhagwan/fzf-lua",

  config = function()

    require('fzf-lua').setup({

      winopts = {

        -- split =   "belowright vnew",
        height           = 0.85,            -- window height
        width            = 0.80,            -- window width
        row              = 0.35,            -- window row position (0=top, 1=bottom)
        col              = 0.50,            -- window col position (0=left, 1=right)
        border           = "rounded",
        backdrop         = 60,
        -- title         = "Title",
        -- title_pos     = "center",        -- 'left', 'center' or 'right'
        -- title_flags   = false,           -- uncomment to disable title flags
        fullscreen       = false,           -- start fullscreen?

        treesitter       = {
              enabled    = true,
              fzf_colors = false --{ ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
        },

        preview = {

          default        = 'bat',
          border         = "rounded",
          wrap           = false,           -- preview line wrap (fzf's 'wrap|nowrap')
          hidden         = false,           -- start preview hidden
          vertical       = "down:45%",      -- up|down:size
          horizontal     = "right:60%",     -- right|left:size
          layout         = "flex",          -- horizontal|vertical|flex
          flip_columns   = 100,             -- #cols to switch to horizontal on flex

        }

      },

        keymap = {

          builtin = {
            -- neovim `:tmap` mappings for the fzf win
            -- true,        -- uncomment to inherit all the below in your custom config
            ["<M-Esc>"]     = "hide",     -- hide fzf-lua, `:FzfLua resume` to continue
            ["<F1>"]        = "toggle-help",
            ["<F2>"]        = "toggle-fullscreen",
          },

          fzf = {

            ["ctrl-z"]      = "abort",
            ["ctrl-u"]      = "unix-line-discard",
            ["ctrl-f"]      = "half-page-down",
            ["ctrl-b"]      = "half-page-up",
            ["ctrl-a"]      = "beginning-of-line",
            ["ctrl-e"]      = "end-of-line",
            ["alt-a"]       = "toggle-all",
            ["alt-g"]       = "first",
            ["alt-G"]       = "last",
            -- fzf preview bat
            ["f3"]          = "toggle-preview-wrap",
            ["f4"]          = "toggle-preview",
            ["shift-down"]  = "preview-page-down",
            ["shift-up"]    = "preview-page-up",

          },
        },

          --[[actions = {

            files = {
              -- true,        -- uncomment to inherit all the below in your custom config
              --["enter"]       = actions.file_edit_or_qf,
              ["ctrl-s"]      = actions.file_split,
              ["ctrl-v"]      = actions.file_vsplit,
              ["ctrl-t"]      = actions.file_tabedit,
              ["alt-q"]       = actions.file_sel_to_qf,
              ["alt-Q"]       = actions.file_sel_to_ll,
              ["alt-i"]       = actions.toggle_ignore,
              ["alt-h"]       = actions.toggle_hidden,
              ["alt-f"]       = actions.toggle_follow,
            },

          },  --]]

          fzf_opts = {

              ["--ansi"]           = true,
              ["--info"]           = "inline-right", -- fzf < v0.42 = "inline"
              ["--height"]         = "100%",
              ["--layout"]         = "reverse",
              ["--border"]         = "none",
              ["--highlight-line"] = true,           -- fzf >= v0.53

          },

          previewers = {

            bat = {
              cmd             = "bat",
              args            = "--color=always --style=numbers,changes",
            },

            man = {
              -- NOTE: remove the `-c` flag when using man-db
              cmd             = "man %s | col -bx",
            },
          },

          treesitter      = {
            enabled = true,
            disabled = {},
            -- nvim-treesitter-context config options
            context = { max_lines = 1, trim_scope = "inner" }
          },

          codeaction_native = {
            diff_opts = { ctxlen = 3 },
            pager = [[delta --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]],
                
         },
          



    })

  end

}
