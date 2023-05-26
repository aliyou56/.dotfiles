return {
  default_config = {
    -- cmd = "cssls",
    filetypes = { 'css', 'scss', 'less' },
    single_file_support = true,
    settings = {
      css = { validate = true },
      scss = { validate = true },
      less = { validate = true },
    },
  },
}
