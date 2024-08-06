return {
  settings = {
    Solargraph = {
      -- root_dir = util.root_pattern("Gemfile", ".git")(fname) or util.path.dirname(vim.api.nvim_buf_get_name(0)),
      root_dir = function(fname)
        return require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
      end,
    },
  },
}
