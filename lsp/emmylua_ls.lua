---@type vim.lsp.Config
return {
	version = "Lua 5.1", -- somehow upgrade vim's lua version so it supports UTF-8
	cmd = { "emmylua_ls" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".emmyrc.json",
		".luacheckrc",
		".git",
	},
	workspace_required = false,
	workspace = {
		library = {
			"$VIMRUNTIME", -- for vim.*
			"$LLS_Addons/luvit", -- for vim.uv.*
			-- (should not be needed in future from what I hear.
			-- I just set $LLS_Addons in my .zshrc to the dir where I
			-- recursively cloned https://github.com/LuaLS/LLS-Addons)
			"$HOME/.local/share/nvim/lazy", -- plugins dir, change to something else if
			-- you don't use lazy.nvim
			vim.api.nvim_get_runtime_file("", true),
		},
		ignoreGlobs = { "**/*_spec.lua" }, -- to avoid some weird type defs in a plugin
	},
}
