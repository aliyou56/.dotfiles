return {
  default_config = {
    -- cmd = "bash-language-server",
    cmd_env = {
      -- Prevent recursive scanning which will cause issues when opening a file
      -- directly in the home directory (e.g. ~/foo.sh).
      --
      -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
      GLOB_PATTERN = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
    filetypes = { 'sh' },
    single_file_support = true,
  },
}
