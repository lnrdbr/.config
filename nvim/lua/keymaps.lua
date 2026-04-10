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
map('n', '<CR>', 'm`o<Esc>``')
map('n', '<S-CR>', 'm`O<Esc>``')


map('n', '<leader>zo', ":ZkNotes<CR>")
map('n', '<leader>zt', ":ZkTags<CR>")
map('n', '<leader>zf', ":ZkNotes { match = { vim.fn.input('Search: ') } }<CR>")
map('v', '<leader>zn', ":'<,'>ZkNewFromTitleSelection<CR>")
map('n', '<leader>zl', ":ZkLinks<CR>")
map('n', '<leader>zb', ":ZkBacklinks<CR>")


-- Google search operator
  local function google_search(text)
    local url = "https://www.google.com/search?q=" .. vim.uri_encode(text)
    vim.ui.open(url)
  end

  local function google_op(type)
    local save = vim.fn.getreg('"')
    if type == "line" then
      vim.cmd('normal! `[V`]y')
    else
      vim.cmd('normal! `[v`]y')
    end
    local text = vim.fn.getreg('"'):gsub("\n", " ")
    vim.fn.setreg('"', save)
    google_search(text)
  end

  vim.g._google_op = google_op

  map('n', '<leader>s', function()
    vim.o.operatorfunc = "v:lua.vim.g._google_op"
    return 'g@'
  end, { expr = true })

  map('x', '<leader>s', function()
    local save = vim.fn.getreg('"')
    vim.cmd('normal! y')
    local text = vim.fn.getreg('"'):gsub("\n", " ")
    vim.fn.setreg('"', save)
    google_search(text)
  end)
