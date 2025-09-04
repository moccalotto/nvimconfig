local M = {
    dump = function(...)
        print(vim.inspect(...))
    end,

    trim = function()
        vim.cmd [[%s/\s\+$//e]]
        vim.cmd [[noh]]
    end,
}



local cmd = vim.api.nvim_create_user_command
cmd("Trim", M.trim, {})
cmd("DumpVim", M.dump, {})
cmd("Commit", function() require("tinygit").smartCommit() end, {})
cmd("Push", function() require("tinygit").push() end, {})

return M
