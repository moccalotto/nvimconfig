return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls", -- lua completion and diagnostics
			"ts_ls", -- javascript and typescript diagnostics and completion
			"stylua", -- lua styling (needed for proper styling/formatting of files that contain non-unicode characters - LSP formatter cannot handle those chars)
		},
		automatic_enable = {
			"lua_ls", --
			"ts_ls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
