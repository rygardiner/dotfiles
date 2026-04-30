return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            cs = { "csharpier" },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 2000,
        },
    },
}
