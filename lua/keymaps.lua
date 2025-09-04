-- LOAD Which-Key plugin
local ok, which_key = pcall(require, "which-key")
if not ok then
    print("Could not load WK plugin!")
    return
end

-----------------------------
-- LEADER AND LOCAL LEADER
--
-- are set in init.lua
-- because they must be set
-- before LAZY
-----------------------------

-----------------------------
-- command line shortcut
-----------------------------
-- must be mapped this way to work smoothly
vim.keymap.set("n", ",", ":")


-- Terminal escape keys
vim.keymap.set("t", "<S-Esc>", '<C-\\><C-n>')                                                 -- exit out of terminal
vim.keymap.set("t", "<C-Space>", function() require("nvterm.terminal").toggle "vertical" end) -- toggle terminal

-----------------------------
-- git keys
-----------------------------
-- must be mapped this way to work smoothly
vim.keymap.set("n", ",", ":")


-- Terminal escape keys
vim.keymap.set("t", "<S-Esc>", '<C-\\><C-n>')                                                 -- exit out of terminal
vim.keymap.set("t", "<C-Space>", function() require("nvterm.terminal").toggle "vertical" end) -- toggle terminal

-----------------------------
-- Which-Key Keymappings
-----------------------------
which_key.add({

    -----------------------------
    -- Misc
    -----------------------------
    { "<backspace>",         "<cmd>noh<cr>",                                                 desc = "Clear search highlight" },
    { "<leader>a",           "ggVG",                                                         desc = "Select all" },

    { "½",                   "^",                                                            desc = "Go to start of line" },
    { "<leader>$",           "^",                                                            desc = "Go to start of line" },
    { "<leader>½",           "$",                                                            desc = "Go to end of line" },

    { "<leader><backspace>", "<cmd>qa!<cr>",                                                 desc = "Close vim without saving!" },
    { "<leader>s",           "<cmd>update<cr>",                                              desc = "Save current buffer" },
    { "<leader>f",           "<cmd>NvimTreeToggle<cr>",                                      desc = "Toggle file explorer" },


    { "<leader><space>",     desc = "Quitting / Exiting" },
    { "<leader><space>q",    "<cmd>wqa!<cr>",                                                desc = "Save all and exit" },

    { "<leader><space>z",    desc = "Are you sure you want to quit without saving? " },
    { "<leader><space>zz",   "<cmd>qa!<cr>",                                                 desc = "Exit without saving" },

    { "<leader>c",           "<cmd>close<cr>",                                               desc = "Close window" },
    { "<leader>q",           "<cmd>bd<cr>",                                                  desc = "Close buffer" },
    { "<leader>Q",           "<cmd>bd!<cr>",                                                 desc = "Close buffer without saving" },

    { "<leader>o",           "<cmd>!open %<cr>",                                             desc = "Make the OS open the file" },

    -----------------------------
    -- Telescope
    -----------------------------
    { "å",                   "<cmd>Telescope find_files<cr>",                                desc = "Find siles by name" },
    { "Å",                   "<cmd>Telescope grep_string<cr>",                               desc = "Find files by content" },
    { "-",                   "<cmd>Telescope buffers<cr>",                                   desc = "Search open buffers" },


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
    -- LSP Code Completion / navigation
    ---------------------------------------
    { "<leader>g",           desc = "Code navigation" },
    { "<leader>gD",          vim.lsp.buf.declaration,                                        desc = "Goto declaration", },
    { "<leader>gd",          vim.lsp.buf.definition,                                         desc = "Goto definition" },
    { "<leader>gr",          vim.lsp.buf.references,                                         desc = "Find all references to the current symbol" },
    { "<leader>gi",          vim.lsp.buf.implementation,                                     desc = "Goto implementation" },
    { "<leader>gt",          vim.lsp.buf.type_definition,                                    desc = "Goto type definition" },
    { "<leader>rn",          vim.lsp.buf.rename,                                             desc = "Rename symbol" },
    { "Ø",                   vim.lsp.buf.signature_help,                                     desc = "Show signature help" },
    { "ø",                   vim.lsp.buf.hover,                                              desc = "Show mouse-hover info" },
    { "æ",                   vim.lsp.buf.code_action,                                        desc = "Perform code refactor actions" },
    { "<leader>gf",          vim.lsp.buf.format,                                             desc = "Code format" },

    { "<F5>",                "<cmd>make<cr>",                                                desc = "Make" },
})
