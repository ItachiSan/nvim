return {
   -- Fuzzy finding
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- TODO: Add extra dependencies for better experience
        },
        keys = function()
            local builtin = require("telescope.builtin")
            return {
                {"<leader>ff", builtin.find_files, desc = "Find files" },
                {"<leader>fg", builtin.live_grep,  desc = "Live grep"  },
            }
        end
    },
 
}
