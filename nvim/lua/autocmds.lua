<<<<<<< HEAD
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight text on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Search highlighting
augroup("SearchHighlight", { clear = true })
autocmd("InsertLeave", {
	group = "SearchHighlight",
	callback = function()
		vim.opt.hlsearch = false
	end,
})
autocmd("CmdlineEnter", {
	group = "SearchHighlight",
	pattern = { "/", "?" },
	callback = function()
		vim.opt.hlsearch = true
	end,
})

-- Return to last edit position when opening files
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
	group = "RestoreCursor",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto resize splits when window is resized
augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
	group = "ResizeSplits",
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Close these filetypes with q
augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
	group = "CloseWithQ",
	pattern = { "help", "man", "qf", "checkhealth", "lspinfo", "git" },
	callback = function(ev)
		vim.bo[ev.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = ev.buf, silent = true })
	end,
})

-- Remove trailing whitespace on save
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
	group = "TrimWhitespace",
	callback = function()
		local cursor = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, cursor)
	end,
})

-- Filetype-specific settings
augroup("FileTypeSettings", { clear = true })
autocmd("FileType", {
	group = "FileTypeSettings",
=======
vim.api.nvim_create_autocmd("FileType", {
>>>>>>> 3e64678 (Working config)
	pattern = "typst",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_gb"
	end,
})
<<<<<<< HEAD
autocmd("FileType", {
	group = "FileTypeSettings",
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_gb"
	end,
})

-- Terminal settings
augroup("TerminalSettings", { clear = true })
autocmd("TermOpen", {
	group = "TerminalSettings",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.cmd("startinsert")
=======

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.hlsearch = false
	end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	pattern = { "/", "?" },
	callback = function()
		vim.opt.hlsearch = true
>>>>>>> 3e64678 (Working config)
	end,
})
