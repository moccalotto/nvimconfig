local cmd = vim.api.nvim_create_user_command
cmd("DumpVim", function (...) print(vim.inspect(...)) end, {})
cmd("Commit", function() require("tinygit").smartCommit() end, {})
cmd("Push", function() require("tinygit").push() end, {})
cmd("Trim", function()
    vim.cmd [[%s/\s\+$//e]]
    vim.cmd [[noh]]
end, {})
