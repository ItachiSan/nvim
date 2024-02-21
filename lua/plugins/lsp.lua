local required_lsp = {
    -- Lua
    lua_ls = {},
    -- Bash
    bashls = {},
    -- Python
    ruff_lsp = {}
}

-- Get only the names so we can provide them to mason-lspconfig
local lsp_ids = {}
local _lsp_pos = 0
for lsp_id, _ in pairs(required_lsp) do
    _lsp_pos = _lsp_pos + 1
    lsp_ids[_lsp_pos] = lsp_id
end

return {
    -- Mason hooks for setting up 
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = lsp_ids,
        },
    },
    -- Setup LSP servers
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            for server, server_config in pairs(required_lsp) do
                lspconfig[server].setup(server_config)
            end
        end,
        keys = {
            {'gD', vim.lsp.buf.declaration},
            {'gd', vim.lsp.buf.definition},
            {'K', vim.lsp.buf.hover},
            {'<leader>ca', vim.lsp.buf.code_action, mode = {'n', 'v'} }
        },
    },
}
