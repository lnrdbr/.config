require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"javascript",
		"typescript",
		"svelte",
		"html",
		"css",
		"json",
		"rust",
		"c",
		"python",
		"bash",
		"markdown",
		"typst",
		"glsl",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
