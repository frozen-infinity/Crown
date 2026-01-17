return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        -- Other clangd specific settings can go here
      },
    },
    -- This applies the diagnostic setting specifically within the LSP setup
    diagnostics = {
      update_in_insert = true,
    },
  },
}
