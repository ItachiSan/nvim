return {
    "nvimtools/none-ls.nvim",
    opts = function()
        local null_ls = require("null-ls")
        return {
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            }
        }
    end,
    keys = {
        { "<leader>cf", vim.lsp.buf.format },
    },
}
