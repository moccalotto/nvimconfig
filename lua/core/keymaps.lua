local keymap = vim.keymap.set
------------------------------------------------------
-- Special keys (that witch-key cannot handle smoothly
------------------------------------------------------
keymap("n", ",", ":") -- Shortcut to colon (because danish keyboard)

--------------------------------
-- SCROLLING
--------------------------------
keymap("n", "<ScrollWheelRight>", "<nop>")                                                -- Disable vertical mouse scroll
keymap("n", "<ScrollWheelLeft>", "<nop>")                                                 -- Disable vertical mouse scroll
keymap({ 'n', "v" }, '<Down>', '"<C-e>"', { expr = true, noremap = true, silent = true }) -- Use arrow keys to scroll the buffer
keymap({ 'n', "v" }, '<Up>', '"<C-y>"', { expr = true, noremap = true, silent = true })   -- Use arrow keys to scroll the buffer
keymap({ 'n', "v" }, '<Left>', '"zh"', { expr = true, noremap = true, silent = true })    -- Use arrow keys to scroll the buffer
keymap({ 'n', "v" }, '<Right>', '"zl"', { expr = true, noremap = true, silent = true })   -- Use arrow keys to scroll the buffer


---------------------------------------
-- TERMINAL
---------------------------------------
keymap("n", "<leader>t", "<nop>", { desc = "Terminal Commands" })
keymap("n", "<leader>tw", "<cmd>TermFloat<cr>", { desc = "Floating Window" })
keymap("n", "<leader>tv", "<cmd>TermVSplit<cr>", { desc = "Vertical Split" })
keymap("n", "<leader>th", "<cmd>TermHSplit<cr>", { desc = "Horizontal Split" })

---------------------------------------
-- CLIPBOARD
---------------------------------------
keymap({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank selection to OS Clipboard" })
keymap("n", "<leader>yy", '"+yy', { desc = "Yank line to OS Clipboard" })
keymap("n", "<leader>p", '"+p', { desc = "Paste OS Clipboard below" })
keymap("n", "<leader>P", '"+P', { desc = "Paste OS Clipboard above" })

---------------------------------------
-- CLOSE / QUIT / EXIT
---------------------------------------
keymap("n", "<leader><space>", "<nop>", { desc = "Quitting/Exiting" })
keymap("n", "<leader><space><space>", "<cmd>wqa!<cr>", { desc = "Save all and exit" })
keymap("n", "<leader><space>q", "<cmd>qa!<cr>", { desc = "Exit without saving" })
keymap("n", "<leader>q", "<cmd>bd<cr>", { desc = "Close buffer if unmodified" })
keymap("n", "<leader>Q", "<cmd>bd!<cr>", { desc = "Close buffer without saving" })
keymap("n", "<leader><backspace>", "<cmd>qa!<cr>", { desc = "Quit vim without saving" })

-----------------------------
-- Telescope
-----------------------------
keymap("n", "å", "<cmd>Telescope find_files<cr>", { desc = "Find files by name" })
keymap("n", "Å", "<cmd>Telescope grep_string<cr>", { desc = "Find files by content" })
keymap("n", "-", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols" })
keymap("n", "_", "<cmd>Telescope buffers<cr>", { desc = "Browse buffers" })
keymap("n", "æ", "<cmd>Telescope diagnostics<cr>", { desc = "Code diagnostics" })

-----------------------------
-- Misc
-----------------------------
keymap("n", "<backspace>", "<cmd>noh<cr>", { desc = "Clear search" })
keymap("n", "<leader>a", "ggVG", { desc = "Select all" })
keymap("n", "<leader>$", "^", { desc = "Go to start of line" })
keymap("n", "<leader>s", "<cmd>update<cr>", { desc = "Save current buffer" })
keymap("n", "<leader>o", "<cmd>!open %<cr>", { desc = "Make OS open this file" })
keymap("n", "<F5>", "<cmd>make<cr>", { desc = "Make" })


---------------------------------------
-- Window / Tab / Buffer navigation
---------------------------------------
keymap("n", "<leader>v", "<cmd>vs<cr>", { desc = "Vertical split" })
--
keymap("n", "gt", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab/buffer" })
keymap("n", "gT", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous tab/buffer" })
--
keymap("n", "<leader>j", "<c-w><down>", { desc = "Move focus to window below" })
keymap("n", "<leader>k", "<c-w><up>", { desc = "Move focus to window above" })
keymap("n", "<leader>l", "<c-w><right>", { desc = "Move focus to window to the right" })
keymap("n", "<leader>h", "<c-w><left>", { desc = "Move focus to window to the left" })
--
keymap("n", "<leader>b", "<nop>", { desc = "Buffer Selection Stuff" })
keymap("n", "<leader>bb", "<cmd>BufferLinePick<cr>", { desc = "Pick an open buffer" })
keymap("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
keymap("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Goto buffer 1" })
keymap("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Goto buffer 2" })
keymap("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Goto buffer 3" })
keymap("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Goto buffer 4" })
keymap("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Goto buffer 5" })
keymap("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Goto buffer 6" })
keymap("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Goto buffer 7" })
keymap("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Goto buffer 8" })
keymap("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Goto buffer 9" })
