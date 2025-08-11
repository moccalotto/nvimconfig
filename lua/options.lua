local default_options = {
    --  timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
    -- guifont = "monofur mono for Powerline:h6", -- the font used in graphical neovim applications
    -- hidden = true, -- required to keep multiple buffers and open multiple buffers
    -- shadafile =
    -- showmode = false, -- we don't need to see things like -- INSERT -- anymore
    -- signcolumn = "yes:1", -- always show the sign column, otherwise it would shift the text each time
    -- titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
    backup         = false,   -- No backup
    background     = "dark",
    cmdheight      = 1,       -- The height of the command line
    colorcolumn    = "99999", -- fixes indentline for now
    completeopt    = { "menuone", "noselect" },
    conceallevel   = 0,       -- so that `` is visible in markdown files
    cursorline     = true,    -- highlight the current line
    expandtab      = true,    -- convert tabs to spaces
    fileencoding   = "utf-8", -- the encoding written to a file
    foldlevel      = 20,
    foldmethod     = "marker",
    gdefault       = true, -- Global search/replace by default
    hlsearch       = true, -- highlight all matches on previous search pattern
    ignorecase     = true, -- ignore case in search patterns
    list           = true,
    listchars      = {
        -- eol = "⤶",
        tab = "▹ ", -- tab must be two or three characters
        trail = "·", -- trailing space
        nbsp = "⍽", -- non breaking space
        -- "⍽"      APL Functional Symbol Circle Backslash (often used to indicate space)
        -- "␣"      Open Box (commonly used to represent a space character)
        -- "·"      Middle Dot (often used in editors to show regular spaces)
        -- "⎵"      Bottom Square Bracket (more boxy/clear visually)
    },
    mouse          = "a",   -- allow the mouse to be used in neovim
    number         = true,  -- set numbered lines
    numberwidth    = 3,     -- width of number column
    -- ruler          = false, -- disable numbers that show line and column in lower right corner
    pumblend       = 5,     -- transparency in PopUpMenu
    pumheight      = 10,    -- pop up menu height
    relativenumber = true,  -- set relative numbered lines
    scrolloff      = 6,     -- minimal number of screen lines to keep above and below the cursor.
    shiftwidth     = 4,     -- the number of spaces inserted for each indentation
    showtabline    = 2,     -- always show tabs
    sidescrolloff  = 8,     -- minimal number of screen chars to keep left and right of the cursor.
    smartcase      = true,  -- smart case
    smartindent    = true,  -- make indenting smarter again
    splitbelow     = true,  -- force all horizontal splits to go below current window
    splitright     = true,  -- force all vertical splits to go to the right of current window
    swapfile       = false, -- creates a swapfile
    tabstop        = 4,     -- insert 4 spaces for a tab
    termguicolors  = true,  -- set term gui colors (most terminals support this)
    title          = true,  -- set the title of window to the value of the titlestring
    undofile       = false, -- enable persistent undo
    updatetime     = 250,   -- faster completion
    wildoptions    = "pum", -- use PopUpMenu in command line
    wrap           = false, -- display lines as one long line
    writebackup    = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    spell          = true,
}

local opt = vim.opt

---  SETTINGS  ---
-- opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
-- opt.shortmess:append "I" -- don't show the default intro message
opt.whichwrap:append "<,>,[,],h,l"
if vim.api.nvim_list_uis() == 0 then
    opt.shortmess = ""   -- try to prevent echo from cutting messages off or prompting
    opt.more = false     -- don't pause listing when screen is filled
    opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
    opt.columns = 9999   -- set the widest screen possible
    opt.swapfile = false -- don't use a swap file
    return
end
-- Load all the default options
for k, v in pairs(default_options) do
    local ok, error = pcall(function()
        opt[k] = v
    end)
    if not ok then
        print(vim.inspect({
            ["Error"] = "ERROR: Could not set option",
            ["Details"] = error,
            ["k"] = k,
            ["v"] = v,
        }))
    end
end


-- Colorscheme
vim.cmd [[colorscheme __apprentice]]

-- Undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]
