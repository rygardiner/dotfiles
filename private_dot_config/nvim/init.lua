require("config.lazy")
require("gardo")

vim.opt.list = true
vim.opt.listchars = { tab = '→ ', space = '·', trail = '~' }
vim.opt.tabstop = 4        -- how wide a tab character displays
vim.opt.shiftwidth = 4     -- how many spaces for each indent level
vim.opt.softtabstop = 4    -- how many spaces Tab/Backspace inserts/removes

vim.opt.number = true         -- enable number line
vim.opt.relativenumber = true -- enable relative line numbers
