return {
    "akinsho/bufferline.nvim",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function() 
        require("bufferline").setup({
            options = {
                numbers = "none",
                diagnostics = "nvim_lsp",
            },
        })
    end,
}
