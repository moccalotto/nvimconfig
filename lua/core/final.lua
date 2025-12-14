----------------
-- Evil Spaces
----------------
-- test:          ⠀👨🏻‍🚀
local evil_spaces = [=[\v[\u00A0\u2000-\u200B\u2060\u2800\u3000]]=]
vim.api.nvim_set_hl(0, 'EvilWhiteSpace', { link = "ErrorMsg" }) -- Use the styling defined by ErrorMsg
vim.fn.matchadd('EvilWhiteSpace', evil_spaces)


------------------
-- Highlight Yank
------------------
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


----------------------
-- Trim Trailing Space
----------------------
vim.api.nvim_create_user_command("Trim", function()
    vim.cmd([[%s/\s\+$//e]])
    vim.cmd([[noh]])
end, {})



-----------------------------------------------------------------------
--  _____                   _             _   ____  _             _
-- |_   _|__ _ __ _ __ ___ (_)_ __   __ _| | |  _ \| |_   _  __ _(_)_ __
--   | |/ _ \ '__| '_ ` _ \| | '_ \ / _` | | | |_) | | | | |/ _` | | '_ \
--   | |  __/ |  | | | | | | | | | | (_| | | |  __/| | |_| | (_| | | | | |
--   |_|\___|_|  |_| |_| |_|_|_| |_|\__,_|_| |_|   |_|\__,_|\__, |_|_| |_|
--                                                          |___/
-----------------------------------------------------------------------
local term = {}
vim.api.nvim_create_user_command("TermFloat", function() term.float() end, {})
vim.api.nvim_create_user_command("TermVSplit", function() term.vsplit() end, {})
vim.api.nvim_create_user_command("TermHSplit", function() term.hsplit() end, {})


--------------------------------
-- Open term in floating window
--------------------------------
function term.float(opts)
    --
    -- Interpret options
    opts                = opts or {}
    local width_ratio   = opts.width_ratio or 1
    local height_ratio  = opts.height_ratio or 1
    local width_margin  = opts.width_margin or 6
    local height_margin = opts.height_margin or 6
    local max_width     = opts.max_width or 120
    local max_height    = opts.max_height or 80
    local border        = opts.border or 'rounded'

    --
    -- Calculate dimensions
    local width         = math.min(math.floor(vim.o.columns * width_ratio - width_margin * 2), max_width)
    local height        = math.min(math.floor(vim.o.lines * height_ratio - height_margin * 2), max_height)

    --
    -- Center the window
    local row           = math.floor((vim.o.lines - height) / 2)
    local col           = math.floor((vim.o.columns - width) / 2)

    --
    -- Create the buffer and open the window
    local buf           = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = border,
    })

    vim.cmd('terminal')
    vim.cmd('startinsert')
end

-----------------------------------------------------------------------
-- Horizontal split terminal
-----------------------------------------------------------------------
function term.hsplit(size)
    size = size or 12
    vim.cmd(size .. 'split')
    vim.cmd('terminal')
    vim.cmd('startinsert')
end

-----------------------------------------------------------------------
-- Vertical split terminal
-----------------------------------------------------------------------
function term.vsplit(size)
    size = size or 0.4 -- ratio if < 1, otherwise columns
    if size < 1 then
        size = math.floor(vim.o.columns * size)
    end
    vim.cmd(size .. 'vsplit')
    vim.cmd('terminal')
    vim.cmd('startinsert')
end
