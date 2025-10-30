return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            ignore_install = { "javascript" },
            modules = {},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            auto_install = true,
            ensure_installed = { "bash", "c", "html",
                "javascript",
                "html",
                "scss",
                "css",
                "make",
                "cmake",
                "json",
                "lua",
                "regex",
                "vim",
                "vimdoc",
                "yaml",
                "go",
            },
        })
    end,
}
