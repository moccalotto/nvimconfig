local _v = vim -- make linter happy

local api = _v.api
local cmd = _v.api.nvim_create_autocmd
local group = _v.api.nvim_create_augroup
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
            helpers.mk_parent_dirs()
            helpers.trim()
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
