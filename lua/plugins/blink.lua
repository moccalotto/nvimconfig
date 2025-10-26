return {
	"saghen/blink.cmp",
	opts = {
		fuzzy = { implementation = "lua" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" }, -- add "lazydev" if lazydev plugin is used.
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
}
