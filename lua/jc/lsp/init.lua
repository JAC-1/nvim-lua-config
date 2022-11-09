local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jc.lsp.mason"
require("jc.lsp.handlers").setup()
require "jc.lsp.null-ls"
