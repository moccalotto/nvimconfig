
-----------------------------------------------------
-- Ensure Lazy plugin is loaded
-----------------------------------------------------
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

-- rtp = runtimepath
vim.opt.rtp:prepend(lazypath)

-- Boot up the Lazy plugin
local ok, lazy = pcall(require, "lazy")
if not ok then
    error("Could not load Lazy plugin manager")
end

-- fetch plugins from each file in the plugins directory
lazy.setup("plugins", require("core.lazy_opt"))

