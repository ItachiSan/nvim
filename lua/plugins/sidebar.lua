return {
	-- Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
			enable_git_status = true,
			filesystems = { follow_current_file = { enabled = true } },
		},
		keys = {
			{
				"<C-n>",
				"<cmd>Neotree action=focus source=filesystem position=left toggle=true reveal_force_cwd=true dir=%:p:h<cr>",
				desc = "Explore files with Neotree",
			},
		},
	},
}
