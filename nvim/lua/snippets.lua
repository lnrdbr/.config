local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Svelte snippets
ls.add_snippets("svelte", {
	s("sts", {
		t('<script lang="ts">'),
		t({ "", "\t" }),
		i(1),
		t({ "", "</script>" }),
	}),
	s("st", {
		t("<script>"),
		t({ "", "\t" }),
		i(1),
		t({ "", "</script>" }),
	}),
	s("sty", {
		t("<style>"),
		t({ "", "\t" }),
		i(1),
		t({ "", "</style>" }),
	}),
	s("each", {
		t("{#each "),
		i(1, "items"),
		t(" as "),
		i(2, "item"),
		t({ "}", "\t" }),
		i(3),
		t({ "", "{/each}" }),
	}),
	s("if", {
		t("{#if "),
		i(1, "condition"),
		t({ "}", "\t" }),
		i(2),
		t({ "", "{/if}" }),
	}),
	s("else", {
		t("{:else}"),
		t({ "", "\t" }),
		i(1),
	}),
	s("elseif", {
		t("{:else if "),
		i(1, "condition"),
		t({ "}", "\t" }),
		i(2),
	}),
	s("await", {
		t("{#await "),
		i(1, "promise"),
		t({ "}", "\t" }),
		i(2, "loading..."),
		t({ "", "{:then " }),
		i(3, "value"),
		t({ "}", "\t" }),
		i(4),
		t({ "", "{:catch " }),
		i(5, "error"),
		t({ "}", "\t" }),
		i(6),
		t({ "", "{/await}" }),
	}),
	s("slot", {
		t("<slot"),
		i(1),
		t(" />"),
	}),
	s("on", {
		t("on:"),
		i(1, "click"),
		t("={"),
		i(2, "handler"),
		t("}"),
	}),
	s("bind", {
		t("bind:"),
		i(1, "value"),
		t("={"),
		i(2, "variable"),
		t("}"),
	}),
})

-- HTML snippets (also useful in Svelte)
ls.add_snippets("html", {
	s("!", {
		t('<!DOCTYPE html>'),
		t({ "", '<html lang="en">' }),
		t({ "", "<head>" }),
		t({ "", '\t<meta charset="UTF-8">' }),
		t({ "", '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">' }),
		t({ "", "\t<title>" }),
		i(1, "Document"),
		t("</title>"),
		t({ "", "</head>" }),
		t({ "", "<body>" }),
		t({ "", "\t" }),
		i(2),
		t({ "", "</body>" }),
		t({ "", "</html>" }),
	}),
})

-- Keymaps for snippet navigation
vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
