return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = {
                prefix = "●",
                spacing = 2,
            },
            signs = true,
            underline = true,
            severity_sort = true,
            update_in_insert = false,
            float = {
                border = "rounded",
                source = "if_many",
            },
        })
    end,
}
