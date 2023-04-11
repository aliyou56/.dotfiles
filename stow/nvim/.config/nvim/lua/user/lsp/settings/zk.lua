return {
  default_config = {
    cmd = { 'zk', 'lsp' },
    filetypes = { 'markdown' },
  },
  commands = {
    ZkIndex = {
      function()
        vim.lsp.buf.execute_command {
          command = 'zk.index',
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
      end,
      description = 'Index',
    },
    ZkNew = {
      function(...)
        vim.lsp.buf_request(0, 'workspace/executeCommand', {
          command = 'zk.new',
          arguments = {
            vim.api.nvim_buf_get_name(0),
            ...,
          },
        }, function(_, result, _, _)
          if not (result and result.path) then
            return
          end
          vim.cmd('edit ' .. result.path)
        end)
      end,

      description = 'ZkNew',
    },
  },
}
