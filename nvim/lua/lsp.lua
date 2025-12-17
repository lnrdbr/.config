local lsps = {
	"lua_ls",
	"cssls",
	"svelte",
	"tinymist",
	"rust_analyzer",
	"ruff",
	"intelephense",
	"tailwindcss",
	"ts_ls",
	"emmet_language_server",
	"emmet_ls",
	"zls",
	"bashls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsps,
})
vim.lsp.enable(lsps)
