local map = vim.keymap.set

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")

map('n', '<leader><leader>', "Vyp")
map('t', '<C-q>', [[<C-\><C-n>:q!<CR>]])
map("i", "jk", "<Esc>", { noremap = true })

map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')

-- zk notes
map('n', '<leader>zn', ":ZkNew { title = vim.fn.input('Title: ') }<CR>")
map('n', '<leader>zo', ":ZkNotes<CR>")
map('n', '<leader>zt', ":ZkTags<CR>")
map('n', '<leader>zf', ":ZkNotes { match = { vim.fn.input('Search: ') } }<CR>")
map('v', '<leader>zn', ":'<,'>ZkNewFromTitleSelection<CR>")
map('n', '<leader>zl', ":ZkLinks<CR>")
map('n', '<leader>zb', ":ZkBacklinks<CR>")
