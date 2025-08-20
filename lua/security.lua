-- Define highlight group
vim.api.nvim_set_hl(0, "SneakySpace", { bg = "red" })

-- Highlight Sneaky Space
vim.fn.matchadd("SneakySpace", [[\u00A0\|\u200B\|\u202F]])
