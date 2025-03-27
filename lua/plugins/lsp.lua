local required_lsp = {
	-- Lua
	lua_ls = {},
	-- Bash
	bashls = {},
	-- PKGBUILD (cannot be installed)
	-- pkgbuild_language_server = {},
	-- Python
	ruff = {},
}

return {
	-- Neodev, ensures types for NVim stupp
	"folke/lazydev.nvim",
	-- Mason hooks for setting up
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = vim.tbl_keys(required_lsp),
		},
	},
	-- Setup LSP servers
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Ensure lazydev is set up before lua_ls
			local lazydev = require("lazydev")
			lazydev.setup()

			-- Get the default server capabilities
			local cmp_lsp = require("cmp_nvim_lsp")
			local lsp_capabilities = cmp_lsp.default_capabilities()

			-- Hook all the servers
			-- Old manual approach
			-- local lspconfig = require("lspconfig")
			-- for server, server_config in pairs(required_lsp) do
			-- 	server_config.capabilities = lsp_capabilities
			-- 	lspconfig[server].setup(server_config)
			-- end
			-- New approach with automagic mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

			local lspconfig = require("lspconfig")
			mason_lspconfig.setup_handlers({
				-- The function with no key is applied to all servers
				function (server_name)
					lspconfig[server_name].setup({capabilities = lsp_capabilities})
				end
			})
		end,
		keys = {
			{ "<leader>cD", vim.lsp.buf.declaration, desc = "Declaration" },
			{ "<leader>cd", vim.lsp.buf.definition, desc = "Definition" },
			{ "<leader>ch", vim.lsp.buf.hover, desc = "Hover" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code action", mode = { "n", "v" } },
		},
	},
}
