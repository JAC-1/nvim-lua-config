local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = {"--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
    -- diagnostics.flake8
	},
})

-- Auto-save --
-- local filetypes = {"*.tsx", "*.css", "*.js", "*.jsx", "*.ts"}
-- for _, filetypes in ipairs(filetypes) do 
--   vim.api.nvim_create_autocmd({
--     event = "BufWritePre",
--     pattern = filetypes,
--     group = "format_on_save",
--     cmd = "lua vim.lsp.buf.format()"
--   })
-- end

