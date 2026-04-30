local M = {}

-- Shared on_attach: buffer-local LSP keymaps.
function M.on_attach(_, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "LSP: go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "LSP: go to declaration")
    map("n", "gi", vim.lsp.buf.implementation, "LSP: go to implementation")
    map("n", "gr", vim.lsp.buf.references, "LSP: references")
    map("n", "K", vim.lsp.buf.hover, "LSP: hover")
    map("n", "<C-k>", vim.lsp.buf.signature_help, "LSP: signature help")
    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: rename")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: code action")
    map("n", "[d", vim.diagnostic.goto_prev, "Diagnostic: prev")
    map("n", "]d", vim.diagnostic.goto_next, "Diagnostic: next")
    map("n", "<leader>e", vim.diagnostic.open_float, "Diagnostic: line float")
    map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostic: loclist")
end

-- Capabilities advertised to the server, augmented by cmp_nvim_lsp when present.
function M.capabilities()
    local caps = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
        caps = cmp_lsp.default_capabilities(caps)
    end
    return caps
end

return M
