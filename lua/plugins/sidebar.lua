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
        keys = {
            { '<leader>ft', '<cmd>Neotree focus filesystem float<cr>',       desc = "Explore files with Neotree" },
            { '<C-n>',      '<cmd>Neotree focus filesystem left toggle<cr>', desc = "Explore files with Neotree" },
        }
    },
}
