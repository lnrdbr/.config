local mason_lsps = {
	"lua_ls",
	"cssls",
	"svelte",
	"tinymist",
	"rust_analyzer",
	"clangd",
	"ruff",
	"glsl_analyzer",
	"intelephense",
	"tailwindcss",
	"ts_ls",
	"emmet_language_server",
	"emmet_ls",
	"zls",
	"bashls",
	"gopls",
}

-- LSPs not managed by mason (shipped with their own SDKs)
local external_lsps = {
	"dartls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = mason_lsps,
})
vim.lsp.enable(vim.list_extend(vim.list_extend({}, mason_lsps), external_lsps))
