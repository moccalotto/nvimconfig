vim.opt.backup = false -- No backup
vim.opt.background = "dark"
vim.opt.cmdheight = 1 -- The height of the command line
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlight the current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.exrc = true -- Allow per-project .nvimrc file
vim.opt.secure = true -- ^ be secure about it ^
vim.opt.foldlevel = 99
vim.opt.foldmethod = "marker"
vim.opt.foldcolumn = "1" -- Show fold indicators
vim.opt.fillchars = { foldopen = "▽", foldclose = "▷", fold = " ", foldsep = "│" }
vim.opt.gdefault = true -- Global search/replace by default
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.list = true
vim.opt.virtualedit = "all" -- allow us to move the cursor beyond EOL
vim.opt.mouse = "a" -- allow the mouse to be used in terminal+neovim
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 4 -- width of number column
vim.opt.pumblend = 5 -- transparency in PopUpMenu
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.scrolloff = 6 -- minimal number of screen lines to keep above and below the cursor.
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.showtabline = 2 -- always show tabs
vim.opt.sidescrolloff = 8 -- minimal number of screen chars to keep left and right of the cursor.
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.undofile = false -- enable persistent undo
vim.opt.updatetime = 250 -- faster completion
vim.opt.wildoptions = "pum" -- use PopUpMenu in command line
vim.opt.wrap = false -- display lines as one long line
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.spell = true
vim.opt.listchars = { tab = "▹ ", trail = "·", nbsp = "⍽" }

-- timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
-- guifont = "monofur mono for Powerline:h6", -- the font used in graphical neovim applications
-- hidden = true, -- required to keep multiple buffers and open multiple buffers
-- shadafile =
-- showmode = false, -- we don't need to see things like -- INSERT -- anymore
-- signcolumn = "yes:1", -- always show the sign column, otherwise it would shift the text each time
-- titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
-- ruler          = false, -- disable numbers that show line and column in lower right corner

---  SETTINGS  ---
-- opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
-- opt.shortmess:append "I" -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")
if vim.api.nvim_list_uis() == 0 then
	vim.opt.shortmess = "" -- try to prevent echo from cutting messages off or prompting
	vim.opt.more = false -- don't pause listing when screen is filled
	vim.opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
	vim.opt.columns = 9999 -- set the widest screen possible
	vim.opt.swapfile = false -- don't use a swap file
	return
end

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Remapping the leader key must be done BEFORE lazy is loaded
vim.g.mapleader = " " -- space
vim.g.maplocalleader = ","

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
