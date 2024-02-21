vim.g.mapleader   = " "
vim.o.number      = true
vim.o.expandtab   = true
vim.o.tabstop     = 4
vim.o.softtabstop = 4
vim.o.shiftwidth  = 4

--[[
Various stuff for lazy later
--]]
local plugins = {
    -- Fuzzy finding
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- TODO: Add extra dependencies for better experience
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep"  })
        end
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "go" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    -- Themes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = true },
}
local opts = {}

--[[
Use lazy.nvim as package manager:
https://github.com/folke/lazy.nvim
Ensure it is loaded with the `require` after it
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup(plugins, opts)

-- local catppuccin = require("catppuccin")
-- catppuccin.setup()
vim.cmd.colorscheme "catppuccin"
