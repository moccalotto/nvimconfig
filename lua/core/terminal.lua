
local M = {}


-----------------------------------------------------------------------
-- Floating terminal
-----------------------------------------------------------------------
function M.float(opts)
    --
    -- Interpret options
    opts = opts or {}
    local width_ratio  = opts.width_ratio or 1
    local height_ratio = opts.height_ratio or 1
    local width_margin = opts.width_margin or 6
    local height_margin = opts.height_margin or 6
    local max_width = opts.max_width or 120
    local max_height = opts.max_height or 80


    local border       = opts.border or 'rounded'

    --
    -- Calculate dimensions
    local width  = math.min(math.floor(vim.o.columns * width_ratio - width_margin * 2), max_width)
    local height = math.min(math.floor(vim.o.lines * height_ratio - height_margin * 2), max_height)

    --
    -- Center the window
    local row    = math.floor((vim.o.lines - height) / 2)
    local col    = math.floor((vim.o.columns - width) / 2)

    --
    -- Create the buffer and open the window
    local buf = vim.api.nvim_create_buf(false, true)
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
function M.hsplit(size)
  size = size or 12
  vim.cmd(size .. 'split')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end

-----------------------------------------------------------------------
-- Vertical split terminal
-----------------------------------------------------------------------
function M.vsplit(size)
  size = size or 0.4 -- ratio if < 1, otherwise columns
  if size < 1 then
    size = math.floor(vim.o.columns * size)
  end
  vim.cmd(size .. 'vsplit')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end

-----------------------------------------------------------------------
-- Optional: user commands
-----------------------------------------------------------------------
vim.api.nvim_create_user_command('TermFloat', function()
  M.float()
end, {})

vim.api.nvim_create_user_command('TermSplit', function()
  M.hsplit()
end, {})

vim.api.nvim_create_user_command('TermVSplit', function()
  M.vsplit()
end, {})


return M
