require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ 'n', 'v' }, '{', '}')
map({ 'n', 'v' }, '}', '{')

map('i', '<C-BS>', '<C-w>')
map('i', '<C-Del>', '<C-o>de')

map('i', '<C-Z>', '<C-o>u')
map('n', '<C-Z>', 'u')

-- LSP --

vim.keymap.set("n", "<leader>dñ", function()
  vim.diagnostic.show()
end, { desc = "Show diagnostics" })

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code actions",
})

-- JAVA --
local java = require("configs.java")

vim.keymap.set("n", "<leader>jp", java.insert_package, { desc = "Insert java package" })
vim.keymap.set("n", "<leader>jc", java.insert_class, { desc = "Insert java class" })
vim.keymap.set("n", "<leader>ji", java.insert_interface, { desc = "Insert java interface" })
vim.keymap.set("n", "<leader>je", java.insert_enum, { desc = "Insert java enum" })



-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
