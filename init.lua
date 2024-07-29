-- Setup our own options
require("options")

-- Various stuff for lazy later
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

-- Do the lazy thing
local lazy = require("lazy")
lazy.setup("plugins", opts)

-- Only manual keybinding
vim.keymap.set('n', '<leader>ml', '<cmd>Lazy<cr>', { desc = "Lazy" })

-- Set up the colorscheme
vim.opt.termguicolors = true
-- vim.cmd.colorscheme "tokyonight"
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme("desert")
