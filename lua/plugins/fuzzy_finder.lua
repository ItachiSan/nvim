return {
   -- Fuzzy finding
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- TODO: Add extra dependencies for better experience
        },
        -- config = function()
        --     -- Set up UI-select stuff here
        --     local telescope = require("telescope")
        --     local telescope_themes = require("telescope.themes")
        --     telescope.setup({
        --         extensions = {
        --             ["ui-select"] = { telescope_themes.get_dropdown {} }
        --         }
        --     })
        -- end,
        opts = function()
            -- Set up UI-select stuff here
            local telescope_themes = require("telescope.themes")
            return {
                extensions = {
                    ["ui-select"] = { telescope_themes.get_dropdown {} }
                }
            }
        end,
        keys = function()
            local builtin = require("telescope.builtin")
            return {
                {"<leader>ff", builtin.find_files, desc = "Find files" },
                {"<leader>fg", builtin.live_grep,  desc = "Live grep"  },
            }
        end
    },
}
