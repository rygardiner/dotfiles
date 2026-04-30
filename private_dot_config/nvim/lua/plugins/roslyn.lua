return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lsp = require("gardo.lsp")
        require("roslyn").setup({
            config = {
                on_attach = lsp.on_attach,
                capabilities = lsp.capabilities(),
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        csharp_enable_inlay_hints_for_types = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                },
            },
        })
    end,
}
