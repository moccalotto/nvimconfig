-- LOAD Which-Key plugin
local ok, which_key = pcall(require, "which-key")
if not ok then
    print("Could not load WK plugin!")
    return
end


------------------------------------------------------
-- Special keys (that witch-key cannot handle smoothly
------------------------------------------------------
vim.keymap.set("n", ",", ":") -- Shortcut to : (because danish keyboard)

--
-- Disable horizontal scrolling
--
vim.keymap.set("n", "<ScrollWheelRight>", "<nop>")
vim.keymap.set("n", "<ScrollWheelLeft>", "<nop>")

-----------------------------
-- Which-Key Keymappings
-----------------------------
which_key.add({

    -----------------------------
    -- Misc
    -----------------------------
    { "<backspace>",         "<cmd>noh<cr>",                                                 desc = "Clear search highlight" },
    { "<leader>a",           "ggVG",                                                         desc = "Select all" },

    { "<leader>p",           '"+p',                                                          desc = "Paste from OS clipboard" },
    { "<leader>y",           '"+y',                                                          desc = "Yank to OS clipboard",                     mode = "v" },

    { "<leader>$",           "^",                                                            desc = "Go to start of line" },

    { "<leader><backspace>", "<cmd>qa!<cr>",                                                 desc = "Close vim without saving!" },
    { "<leader>s",           "<cmd>update<cr>",                                              desc = "Save current buffer" },

    { "<leader><space>",     desc = "Quitting / Exiting" },
    { "<leader><space>q",    "<cmd>wqa!<cr>",                                                desc = "Save all and exit" },

    { "<leader><space>z",    desc = "Are you sure you want to quit without saving? " },
    { "<leader><space>zz",   "<cmd>qa!<cr>",                                                 desc = "Exit without saving" },

    { "<leader>q",           "<cmd>bd<cr>",                                                  desc = "Close buffer" },
    { "<leader>Q",           "<cmd>bd!<cr>",                                                 desc = "Close buffer without saving" },

    { "<leader>o",           "<cmd>!open %<cr>",                                             desc = "Make the OS open the file" },

    -----------------------------
    -- GIT
    -----------------------------
    --- NO COMMANDS YET

    -----------------------------
    -- Telescope
    -----------------------------
    { "å",                   "<cmd>Telescope find_files<cr>",                                desc = "Find siles by name" },
    { "Å",                   "<cmd>Telescope grep_string<cr>",                               desc = "Find files by content" },
    { "-",                   "<cmd>Telescope lsp_document_symbols<cr>",                      desc = "Search for symbols" },
    { "_",                   "<cmd>Telescope buffers<cr>",                                   desc = "Browse open files" },
    { "æ",                   "<cmd>Telescope diagnostics<cr>",                               desc = "Code diagnostics" },


    ---------------------------------------
    -- Tab / Buffer navigation
    ---------------------------------------
    { "<c-PageUp>",          "<cmd>BufferLineCyclePrev<cr>",                                 desc = "Next tab/buffer" },
    { "gt",                  "<cmd>BufferLineCycleNext<cr>",                                 desc = "Next tab/buffer" },
    { "<c-PageDown>",        "<cmd>BufferLineCycleNext<cr>",                                 desc = "Previous tab/buffer" },
    { "gT",                  "<cmd>BufferLineCyclePrev<cr>",                                 desc = "Previous tab/buffer" },


    ---------------------------------------
    -- Window navigation
    ---------------------------------------
    { "<leader>j",           "<c-w><down>",                                                  desc = "Move focus to window below" },
    { "<leader>k",           "<c-w><up>",                                                    desc = "Move focus to window above" },
    { "<leader>l",           "<c-w><right>",                                                 desc = "Move focus to window to the right" },
    { "<leader>h",           "<c-w><left>",                                                  desc = "Move focus to window to the left" },



    ---------------------------------------
    -- TERMINAL
    ---------------------------------------
    { "<leader>t",           desc = "Terminal Stuff" },
    { "<leader>th",          function() require("nvterm.terminal").toggle('horizontal') end, desc = "Horizontal Terminal" },
    { "<leader>tv",          function() require("nvterm.terminal").toggle('vertical') end,   desc = "Vertical Terminal" },
    { "<leader>tt",          function() require("nvterm.terminal").toggle('float') end,      desc = "Floating Terminal" },
    { "<C-Space>",           function() require("nvterm.terminal").toggle('vertical') end,   desc = "Toggle Vertical Terminal" }, -- extra shortcut


    ---------------------------------------
    -- CODE
    ---------------------------------------
    { "<F5>",                "<cmd>make<cr>",                                                desc = "Make" },
})
