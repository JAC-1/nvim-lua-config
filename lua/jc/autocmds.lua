
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.tsx", "*.css", "*.ts", "*.jsx", ".js"},
  -- group = "format_on_save",
  callback = function()
    vim.lsp.buf.format()
  end,
})
