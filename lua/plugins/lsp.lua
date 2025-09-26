return {
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Add LSP capabilities for autocompletion
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = false,
            })

            -- LSP keymaps (will be set when LSP attaches to buffer)
            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr, silent = true }

                vim.opt_local.foldmethod = "expr"
                vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
                vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "Ø", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "ø", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "æ", vim.lsp.buf.code_action, opts)
                vim.keymap.set("v", "æ", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>gf", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end

            -- Lua Language Server
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim", "hs" }, -- Recognize 'vim' global
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = true,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Go Language Server
            lspconfig.gopls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            })

            -- JavaScript/TypeScript Language Server
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                init_options = {
                    preferences = {
                        disableSuggestions = true,
                    },
                },
            })

            -- ESLint linter
            lspconfig.eslint.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                -- bin = "eslint_d",
                cmd = { 'vscode-eslint-language-server', '--stdio' }
            })

            lspconfig.html.setup({
                capabilities = vim.lsp.protocol.make_client_capabilities(),
                on_attach = on_attach,
            });
        end,
    },

    -- Mason for managing LSP servers
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "gopls",
                "html-lsp",
                "typescript-language-server",
                "stylua",  -- Lua formatter
                "gofumpt", -- Go formatter
                "prettier",
                "standardjs",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            mr:on("package:install:success", function()
                vim.defer_fn(function()
                    require("lazy.core.handler.event").trigger({
                        event = "FileType",
                        buf = vim.api.nvim_get_current_buf(),
                    })
                end, 100)
            end)
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },

    -- Mason-LSPConfig bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "ts_ls", "eslint" },
                automatic_installation = true,
            })
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",           -- source for text in buffer
            "hrsh7th/cmp-path",             -- source for file system paths
            "hrsh7th/cmp-cmdline",          -- source for command line
            "L3MON4D3/LuaSnip",             -- snippet engine
            "saadparwaiz1/cmp_luasnip",     -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load snippets from friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                -- snippet = {
                --     expand = function(args)
                --     -- /Users/krh/.config/nvim/lua/plugins/lsp.lua:196: attempt to call field 'Isnip_expand' (a nil value)
                --         luasnip.lsnip_expand(args.body)
                --     end,
                -- },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- Treesitter for better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-autopairs",
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                modules = {},
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
                autopairs = {
                    enable = true,
                },
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "go",
                    "javascript",
                    "typescript",
                    "json",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "bash",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })
        end,
    },

    -- -- Auto pairs
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     config = function()
    --         local autopairs = require("nvim-autopairs")
    --         autopairs.setup({
    --             check_ts = true, -- treesitter integration
    --             disable_filetype = { "TelescopePrompt" },
    --         })
    --
    --         -- Integration with cmp
    --         local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --         local cmp = require("cmp")
    --         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --     end,
    -- },

    -- Optional: Better LSP UI
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                ui = {
                    code_action = "",
                    winblend = 10,
                    border = "rounded",
                    colors = {
                        normal_bg = "#002b36",
                    },
                },
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Plugin especially for editing neovim's lua files
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
