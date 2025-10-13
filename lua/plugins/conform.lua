--
-- Conform helps us actually USE many of the language servers
-- and plugins installable via Mason.
--
--We could also have used null_ls, but it has a weird name ;-P
--
return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier", "js_beautify", stop_after_first = true },
                typescript = { "prettier", "js_beautify", stop_after_first = true },
                json = { "prettier" },
                html = { "qc", "prettier", stop_after_first = true },
                css = { "prettier" },
                scss = { "prettier" },
                markdown = { "prettier" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters = {
                prettier = {
                    prepend_args = { "--config", vim.fn.expand("~/.config/prettier/prettierrc") },
                },
            },
        })
    end,
}
