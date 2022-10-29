return {
  default_config = {
    -- cmd = "html",
    filetypes = { 'html' },
    single_file_support = true,
    settings = {},
    init_options = {
      provideFormatter = true,
      embeddedLanguages = { css = true, javascript = true },
      configurationSection = { 'html', 'css', 'javascript' },
    },
  },
}
