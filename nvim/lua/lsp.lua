local lsps = {
	"lua_ls",
	"cssls",
	"svelte",
	"tinymist",
	"rust_analyzer",
<<<<<<< HEAD
	"ruff",
=======
	"clangd",
	"ruff",
	"glsl_analyzer",
	"haskell-language-server",
	"hlint",
>>>>>>> 3e64678 (Working config)
	"intelephense",
	"tailwindcss",
	"ts_ls",
	"emmet_language_server",
	"emmet_ls",
<<<<<<< HEAD
=======
	"solargraph",
>>>>>>> 3e64678 (Working config)
	"zls",
	"bashls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsps,
})
vim.lsp.enable(lsps)
<<<<<<< HEAD
=======

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
>>>>>>> 3e64678 (Working config)
