local bossmode_keys = {
    { { "n", "v", "i" }, "<up>" },
    { { "n", "v", "i" }, "<down>" },
    { { "n", "v", "i" }, "<left>" },
    { { "n", "v", "i" }, "<right>" },
    { { "n", "v", },     "<home>" },
    { { "n", "v", },     "<end>" },

    -- These keys
    -- { { "n", "v", },     "<pageup>" },
    -- { { "n", "v", },     "<pagedown>" },
    -- { { "n", "v", },     "h" },
    -- { { "n", "v", },     "l" },
}

local EasyMode = function()
    for _, entry in ipairs(bossmode_keys) do
        pcall(function() -- Fail silently if we cannot delete the keymapping
            vim.keymap.del(entry[1], entry[2])
        end)
    end
    print("EasyMode enabled. Type :BossMode to enable BossMode")
end

local BossMode = function()
    local action = function()
        print("BossMode enabled. Type :EasyMode to enable this key")
    end
    for _, entry in ipairs(bossmode_keys) do
        vim.keymap.set(entry[1], entry[2], action)
    end

    vim.keymap.set("n", "<down>", "<C-e>", { noremap = true }) -- scroll down one line
    vim.keymap.set("n", "<up>", "<C-y>", { noremap = true })   -- scroll up one line
end

local cmd = vim.api.nvim_create_user_command
cmd("EasyMode", EasyMode, {})
cmd("BossMode", BossMode, {})

BossMode()
