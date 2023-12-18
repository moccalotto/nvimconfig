local g_vim = vim -- make linter happy


-----------------------------------------------------
-- Do stuff that must be done before Lazy is loaded.
-----------------------------------------------------
g_vim.g.mapleader = " " -- space
g_vim.g.maplocalleader = ","

require "helpers"
require "options"

-----------------------------------------------------
-- Ensure Lazy plugin is loaded
-----------------------------------------------------
local lazypath = g_vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not g_vim.loop.fs_stat(lazypath) then
    g_vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- rtp = runtimepath
g_vim.opt.rtp:prepend(lazypath)

-- Boot up the Lazy plugin
local ok, lazy = pcall(require, "lazy")
if not ok then
    error("Could not load Lazy plugin manager")
end

-- fetch plugins from each file in the plugins directory
lazy.setup("plugins", require("lazy_opt"))

-----------------------------------------------------
-- Load our own stuff
-----------------------------------------------------
--

-- require "autocommands"
require "neovide"
require "keymaps"
require "bossmode"
