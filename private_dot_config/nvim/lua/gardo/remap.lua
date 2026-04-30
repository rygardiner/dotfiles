vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- C# / .NET buffer-local build/test/run keymaps
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cs",
    callback = function(args)
        local map = function(lhs, cmd, desc)
            vim.keymap.set("n", lhs, "<cmd>!dotnet " .. cmd .. "<cr>", { buffer = args.buf, desc = desc })
        end
        map("<leader>db", "build", "dotnet build")
        map("<leader>dt", "test", "dotnet test")
        map("<leader>dr", "run", "dotnet run")
    end,
})
