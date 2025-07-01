local cmd = vim.api.nvim_create_user_command

local M = {
    dump = function(...)
        print(vim.inspect(...))
    end,

    trim = function()
        vim.cmd [[%s/\s\+$//e]]
        vim.cmd [[noh]]
    end,

    mk_parent_dirs = function()
        local dir = vim.fn.expand('<afile>:p:h')

        -- This handles URLs using netrw. See ':help netrw-transparent' for details.
        if dir:find('%l+://') == 1 then
            return
        end

        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
            vim.notify(dir, vim.log.levels.INFO, { title = "Created parent directories", })
        end
    end
}

cmd("Trim", M.trim, {})
cmd("DumpVim", M.dump, {})

cmd("Commit", function() require("tinygit").smartCommit() end, {})
cmd("Push", function() require("tinygit").push() end, {})

return M
