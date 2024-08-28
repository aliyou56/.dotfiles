local M = {
  "rcarriga/nvim-notify",
}

function M.config()
  local banned_messages = {
    "No information available",
    "No existing session to load."
  }
  vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
      if msg == banned then
        return
      end
    end
    return require "notify"(msg, ...)
  end
end

return M
