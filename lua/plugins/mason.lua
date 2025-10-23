return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "stylua", "lua_ls", "eslint" },
		automatic_enable = true,
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
