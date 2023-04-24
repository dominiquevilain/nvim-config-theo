local ok, rust_tools = pcall(require, "rust-tools")

if not ok then
	return
end

rust_tools.setup {
	server = {
		on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true }
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
			vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
			vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
		end,
	}
}