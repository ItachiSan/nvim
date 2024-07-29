return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- Somehow the default "config" messes up. Do it manually
		config = function()
			require("lualine").setup()
		end,
	},
}
