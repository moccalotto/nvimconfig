vim.lsp.config("*", {
    virtual_text = { current_line = true },
    virtual_lines = true,
    underline = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    update_in_insert = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})


local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'

    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- defaults:
        -- https://neovim.io/doc/user/news-0.11.html#_defaults

        map("æ", vim.diagnostic.open_float, "Open Diagnostic Float")
        map("ø", vim.lsp.buf.hover, "Hover Documentation")
        map("Ø", vim.lsp.buf.declaration, "Goto Declaration")
        map("Æ", vim.lsp.buf.code_action, "Code Action")

        map("<leader>c", "<nop>", "LSP Commands")
        map("<leader>ch", vim.lsp.buf.signature_help, "Signature Documentation")
        map("<leader>cn", vim.lsp.buf.rename, "Rename Identifier")
        map("<leader>cf", vim.lsp.buf.format, "Format")
        map("<leader>cr", vim.lsp.buf.references, "List references")
        map("<leader>cd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Open definition in Vertical Split")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client == nil then
            return
        end

        local function client_supports_method(method, bufnr)
            if vim.fn.has("nvim-0.11") == 1 then
                return client:supports_method(method, bufnr)
            else
                ---@diagnostic disable-next-line
                return client.supports_method(method, { bufnr = bufnr })
            end
        end


        vim.lsp.completion.enable(true, client.id, event.buf, {
            autotrigger = true,
            convert = function(item)
                return { abbr = item.label:gsub('%b()', '') }
            end,
        })

        if client_supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local autogroup = vim.api.nvim_create_augroup("lsp-autogroup", { clear = false })

            -- When cursor stops moving: Highlights all instances of the symbol under the cursor
            -- When cursor moves: Clears the highlighting
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = autogroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = autogroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = event.buf,
                group = autogroup,
                callback = function()
                    vim.lsp.buf.format { async = false, id = client.id }
                end,
            })

            -- When LSP detaches: Clears the highlighting
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    -- vim.api.nvim_clear_autocmds({ group = "lsp-autogroup", buffer = event2.buf })
                    vim.api.nvim_clear_autocmds({ group = autogroup, buffer = event2.buf })
                end,
            })
        end
    end,
})
