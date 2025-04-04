return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()

    require("copilot").setup({

        panel = { enabled = false, },
        suggestion = { enabled = false, },

        filetypes = {
            bash = true,
            css = true,
            shell = true,
            python = true,
            javascript = true,
            yaml = true,
            markdown = true,
            ["*"] = false,

            sh = function ()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
                -- disable for .env files
                return false
                end
                return true
                end,
        },



    })

    end,
}
