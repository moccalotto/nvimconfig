local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

--{{{
local default_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
            group = formatting_group,
            buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = formatting_group,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end
--}}}

return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        "mason-org/mason.nvim",
        "hrsh7th/nvim-cmp",
        "jose-elias-alvarez/null-ls.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup()
        local lsp = require("lspconfig")
        local util = require "lspconfig/util"
        local default_caps = require('cmp_nvim_lsp').default_capabilities()
        local default_args = {
            capabilities = default_caps,
            on_attach = default_attach,
        }

        --------------------------
        -- JSON
        --------------------------
        lsp.jsonls.setup(default_args)


        --------------------------
        -- CLANGD
        --------------------------
        -- lsp.clangd.setup(default_args)


        --------------------------
        -- Javascript / ecmascript
        --------------------------
        lsp.eslint.setup({
            capabilities = default_caps,
            on_attach = default_attach,
            bin = 'eslint', -- or `eslint_d`
            code_actions = {
                enable = true,
                apply_on_save = {
                    enable = true,
                    types = { "directive", "problem", "suggestion", "layout" },
                },
                disable_rule_comment = {
                    enable = true,
                    location = "separate_line", -- or `same_line`
                },
            },
            diagnostics = {
                enable = true,
                report_unused_disable_directives = false,
                run_on = "type", -- or `save`
            },
        })


        ----------------------
        --Grammar and spelling
        ----------------------
        --- It became altogether too much.
        -- lsp.ltex.setup({
        --     on_attach = default_on_attach,
        --     cmd = { "ltex-ls" },
        --     filetypes = { "markdown", "text", "asciidoc" },
        --     flags = { debounce_text_changes = 300 },
        -- })


        ------------------------
        -- LUA
        ------------------------
        lsp.lua_ls.setup({
            capabilities = default_caps,
            on_attach = default_attach,
            root_dir = util.root_pattern("meta.lua", "init.lua", "main.lua"),
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                },
            },
        })

        ------------------------
        -- GO
        ------------------------
        lsp.gopls.setup({
            capabilities = default_caps,
            cmd = { "gopls", "serve" },
            filetypes = { "go", "gomod" },
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            },
            on_attach = function(client, bufnr)
                vim.opt.foldmethod = "syntax"
                vim.opt.foldlevel = 20

                require("which-key").register({
                    ["<F5>"] = { "<cmd>!go run .<cr>", "go run" },
                    ["<F8>"] = { vim.lsp.buf.format, "format document" },
                    ["<F9>"] = { "<cmd>!go fmt %<cr>", "go fmt" },
                })

                default_attach(client, bufnr)
            end
        })
    end,
}
