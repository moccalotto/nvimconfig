---@type vim.lsp.Config
return {
    version = "Lua 5.1", -- somehow upgrade vim's lua version so it supports UTF-8
    -- cmd = { "emmylua_ls" },
    -- filetypes = { "lua" },
    -- root_markers = {
    --     ".luarc.json",
    --     ".emmyrc.json",
    --     ".luacheckrc",
    --     ".git",
    -- },
    -- workspace_required = false,
    -- workspace = {
    --     ignoreGlobs = { "**/*_spec.lua" }, -- to avoid some weird type defs in a plugin
    -- },
}
