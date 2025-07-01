local api = vim.api
local cmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup
local helpers = require("helpers")


---------------------------
-- BEFORE SAVE
--
-- trim files
-- ensure parent dirs exist
---------------------------
cmd(
    { "BufWritePre" },
    {
        pattern = { "*" },
        group = group("MkDir", { clear = true }),
        callback = function()
            helpers.mk_parent_dirs() -- create parent directories when saving a new file
            helpers.trim()           -- trim trailing whitespace from every line.
        end,
    }
)


-------------------------
-- Cursor Line
-------------------------
local cursorGroup = api.nvim_create_augroup("CursorLine", { clear = true })

api.nvim_create_autocmd(
    { "InsertLeave", "WinEnter", "BufEnter" },
    { pattern = "*", command = "set nocursorline", group = cursorGroup }
)
api.nvim_create_autocmd(
    { "InsertEnter", "WinLeave" },
    { pattern = "*", command = "set cursorline", group = cursorGroup }
)
