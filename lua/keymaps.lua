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
which_key.register({

    -----------------------------
    -- Misc
    -----------------------------
    ["<backspace>"] = { "<cmd>noh<cr>", "Clear search highlight" },
    ["<leader>a"] = { "ggVG", "Select all" },

    ["½"] = { "^", "Go to start of line" },
    ["<leader>½"] = { "$", "Go to end of line" },

    ["<leader><backspace>"] = { "<cmd>qa!<cr>", "Close vim without saving!" },
    ["<leader>w"] = { "<cmd>update<cr>", "Save current buffer" },
    ["<leader>f"] = { "<cmd>NvimTreeToggle<cr>", "Toggle file explorer" },


    ["<leader><space>"] = { name = "Quitting / Exiting" },
    ["<leader><space>q"] = { "<cmd>wqa!<cr>", "Save all and exit" },
    ["<leader><space>z"] = { name = "Are you sure you want to quit without saving? " },
    ["<leader><space>zz"] = { "<cmd>qa!<cr>", "Exit without saving" },

    ["<leader>q"] = { "<cmd>bd<cr>", "Close buffer" },
    ["<leader>Q"] = { "<cmd>bd!<cr>", "Close buffer without saving" },

    -----------------------------
    -- Telescope
    -----------------------------
    ["å"] = { "<cmd>Telescope find_files<cr>", "Find siles by name" },
    ["<c-p>"] = { "<cmd>Telescope find_files<cr>", "Find siles by name" },
    ["Å"] = { "<cmd>Telescope grep_string<cr>", "Find files by content" },
    ["-"] = { "<cmd>Telescope buffers<cr>", "Search open buffers" },


    ---------------------------------------
    -- Tab / Buffer navigation
    ---------------------------------------
    ["<c-PageUp>"] = { "<cmd>BufferLineCyclePrev<cr>", "Next tab/buffer" },
    ["gt"] = { "<cmd>BufferLineCycleNext<cr>", "Next tab/buffer" },
    ["<c-PageDown>"] = { "<cmd>BufferLineCycleNext<cr>", "Previous tab/buffer" },
    ["gT"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous tab/buffer" },


    ---------------------------------------
    -- Window navigation
    ---------------------------------------
    ["<leader>j"] = { "<c-w><down>", "Move focus to window below" },
    ["<leader>k"] = { "<c-w><up>", "Move focus to window above" },
    ["<leader>l"] = { "<c-w><right>", "Move focus to window to the right" },
    ["<leader>h"] = { "<c-w><left>", "Move focus to window to the left" },



    ---------------------------------------
    -- TERMINAL
    ---------------------------------------
    ["<leader>t"] = { name = "Terminal Stuff" },
    ["<leader>th"] = { function() require("nvterm.terminal").toggle('horizontal') end, "Horizontal Terminal" },
    ["<leader>tv"] = { function() require("nvterm.terminal").toggle('vertical') end, "Vertical Terminal" },
    ["<leader>tt"] = { function() require("nvterm.terminal").toggle('float') end, "Floating Terminal" },
    ["<C-Space>"] = { function() require("nvterm.terminal").toggle('vertical') end, "Toggle Vertical Terminal" }, -- extra shortcut


    ---------------------------------------
    -- LSP Code Completion / navigation
    ---------------------------------------
    ["<leader>g"] = { name = "Code navigation" },
    ["<leader>gt"] = { vim.lsp.buf.type_definition, "Goto type definition", },
    ["<leader>gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
    ["<leader>gr"] = { vim.lsp.buf.references, "Find all references to the current symbol" },
    ["<leader>gf"] = { vim.lsp.buf.formatting, "Code formatting", },
    ["<F2>"] = { vim.lsp.buf.rename, "Rename all symbols under cursor" },
    ["<c-k>"] = { vim.lsp.buf.signature_help, "Show signature help" },
    ["ø"] = { vim.lsp.buf.hover, "Pretend mouse cursor is hovering over word" },
    ["Ø"] = { vim.lsp.buf.references, "Find all references to the current symbol" },
    ["<F12>"] = { vim.lsp.buf.definition, "Go to definition" },

    ["<F5>"] = { "<cmd>make<cr>", "Make" },
})
