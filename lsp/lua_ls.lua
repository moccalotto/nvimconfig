return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				telemetry = {
					enable = true,
				},
				completion = {
					enable = true,
				},
				path = vim.split(package.path, ";"),
			},
			workspace = {
				library = { vim.env.VIMRUNTIME .. "/lua" },
			},
		},
	},
}
