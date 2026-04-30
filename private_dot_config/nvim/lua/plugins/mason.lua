return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        },
    },
}
