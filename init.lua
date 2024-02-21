-- Setup our own options
require("options")

--[[
Various stuff for lazy later
--]]
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
lazy.setup("plugins", opts)

-- local catppuccin = require("catppuccin")
-- catppuccin.setup()
vim.cmd.colorscheme "catppuccin"
