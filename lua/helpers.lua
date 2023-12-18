local _v = vim -- make linter happy
local cmd = _v.api.nvim_create_user_command

local M = {
    dump = function(...)
        print(_v.inspect(...))
    end,

    trim = function()
        _v.cmd [[%s/\s\+$//e]]
        _v.cmd [[noh]]
    end,

    mk_parent_dirs = function()
        local dir = _v.fn.expand('<afile>:p:h')

        -- This handles URLs using netrw. See ':help netrw-transparent' for details.
        if dir:find('%l+://') == 1 then
            return
        end

        if _v.fn.isdirectory(dir) == 0 then
            _v.fn.mkdir(dir, 'p')
            _v.notify(dir, vim.log.levels.INFO, { title = "Created parent directories", })
        end
    end
}

cmd("Trim", M.trim, {})
cmd("DumpVim", M.dump, {})

cmd("Commit", function() require("tinygit").smartCommit() end, {})
cmd("Push", function() require("tinygit").push() end, {})

return M
