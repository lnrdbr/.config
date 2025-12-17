require('onedark').setup({
	style = 'darker',
	colors = {
		bg0 = '#181818',
	},
	highlights = {
		['@tag'] = { fg = '$red' },
		['@tag.attribute'] = { fg = '$yellow' },
		['@tag.delimiter'] = { fg = '$fg' },
		['@tag.builtin'] = { fg = '$red' },
	}
})
require('onedark').load()
