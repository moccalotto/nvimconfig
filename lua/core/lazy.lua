-----------------------------------------------------
-- Ensure Lazy plugin is loaded
-----------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })   
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

-- rtp = runtimepath
vim.opt.rtp:prepend(lazypath)

-- Boot up the Lazy plugin
local ok, lazy = pcall(require, "lazy")
if not ok then
    error("Could not load Lazy plugin manager")
end

-- fetch plugins from each file in the plugins directory
lazy.setup( { import = "plugins" }, {
    install = {
        missing = true,
        notify = false,
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                -- "2html_plugin",
                -- "tohtml",
                -- "getscript",
                -- "getscriptPlugin",
                -- "gzip",
                -- "logipat",
                -- "netrw",
                -- "netrwPlugin",
                -- "netrwSettings",
                -- "netrwFileHandlers",
                -- "matchit",
                -- "tar",
                -- "tarPlugin",
                -- "rrhelper",
                -- "spellfile_plugin",
                -- "vimball",
                -- "vimballPlugin",
                -- "zip",
                -- "zipPlugin",
                -- "tutor",
                -- "rplugin",
                -- "syntax",
                -- "synmenu",
                -- "optwin",
                -- "compiler",
                -- "bugreport",
                -- "ftplugin",
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
