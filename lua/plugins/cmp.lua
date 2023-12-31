return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/nvim-cmp",
        -- ALREADY INCLUDED ELSEWHERE: "L3MON4D3/LuaSnip,"
    },

    --     icons = true,
    -- lspkind_text = true,
    -- style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    -- border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    -- selected_item_bg = "colored", -- colored / simple

    config = function()
        local cmp = require("cmp")
        print "loading cmp"
        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- TODO: move this stuff to keymaps file
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' },
                    {
                        name = "luasnip",
                        option = {
                            show_autosnippets = true,
                            --  use_show_condition = false
                        }
                    },
                }),
        })
    end,
}
