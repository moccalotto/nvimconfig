-- Autocommand to set a project-local spell file
vim.api.nvim_create_autocmd("DirChanged", {
    callback = function(args)
        -- Get the full path to the potential spell file
        local spell_file = args.cwd .. "/en.utf-8.add"

        -- Check if the file exists
        if vim.fn.filereadable(spell_file) == 1 then
            -- Set the spellfile option for the current buffer
            vim.opt_local.spellfile = spell_file
            vim.notify("Project-local spell file loaded.")
        else
            -- If the file doesn't exist, clear the local spellfile setting
            vim.opt_local.spellfile = ""
        end
    end
})
