return {
	{
		"williamboman/mason.nvim",
		-- Name mismatch between package and setup. Ensure it is set up
		config = function()
			require("mason").setup()
		end,
		keys = {
			{ "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" },
		},
	},
	{
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
				},
			}
		end,
		keys = {
			{ "<leader>cf", vim.lsp.buf.format, desc = "Format files" },
		},
	},
}
