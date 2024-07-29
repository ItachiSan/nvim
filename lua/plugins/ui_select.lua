-- Set up UI select for stuff

return {
	"nvim-telescope/telescope-ui-select.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	-- All telescope settings are in the fuzzy finder file, where telescope lives.
	-- Here just do the final hook up
	config = function()
		local telescope = require("telescope")
		-- To get ui-select loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		telescope.load_extension("ui-select")
	end,
}
